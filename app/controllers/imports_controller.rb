class ImportsController < ApplicationController
  # GET /imports
  def index
    @imports = Import.recent.page(params[:page]).per(10)
  end

  # GET /imports/new
  def new
    @import = Import.new
  end

  # POST /imports
  def create
    unless params[:csv_file].present?
      redirect_to new_import_path, alert: 'Please select a CSV file'
      return
    end
    
    csv_file = params[:csv_file]
    user_email = params[:user_email].presence || 'admin@example.com'
    
    # Перевірка типу файлу
    unless csv_file.content_type == 'text/csv' || csv_file.original_filename.end_with?('.csv')
      redirect_to new_import_path, alert: 'Please upload a CSV file'
      return
    end
    
    # Збереження тимчасового файлу
    temp_file_path = Rails.root.join('tmp', "import_#{Time.current.to_i}_#{csv_file.original_filename}")
    File.open(temp_file_path, 'wb') do |file|
      file.write(csv_file.read)
    end
    
    # Створення запису імпорту
    import = Import.create!(
      user_email: user_email,
      filename: csv_file.original_filename,
      status: 'pending'
    )
    
    # Запуск фонової задачі
    ImportBooksJob.perform_later(import.id, temp_file_path.to_s)
    
    redirect_to import_path(import), notice: 'Import started successfully'
  end

  # GET /imports/:id
  def show
    @import = Import.find(params[:id])
  end
end