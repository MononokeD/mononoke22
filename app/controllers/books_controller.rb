class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  def index
    @books = Book.includes(:author).all
    
    # Пошук по назві
    @books = @books.by_title(params[:search_title]) if params[:search_title].present?
    
    # Пошук по автору
    @books = @books.by_author_name(params[:search_author]) if params[:search_author].present?
    
    # Сортування
    @books = @books.sorted_by(params[:sort]) if params[:sort].present?
    
    # За замовчуванням сортуємо за датою створення
    @books = @books.order(created_at: :desc) unless params[:sort].present?
  end

  # GET /books/1
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
    @active_authors = Author.active.ordered_by_name
  end

  # POST /books
  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to @book, notice: 'Book was successfully created.'
    else
      @active_authors = Author.active.ordered_by_name
      render :new, status: :unprocessable_entity
    end
  end

  # GET /books/1/edit
  def edit
    @active_authors = Author.active.ordered_by_name
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      redirect_to @book, notice: 'Book was successfully updated.'
    else
      @active_authors = Author.active.ordered_by_name
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy
    redirect_to books_url, notice: 'Book was successfully destroyed.'
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :author_id, :year, :description, :cover, :remove_cover)
    end
end