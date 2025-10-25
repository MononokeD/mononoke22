module Api
  module V1
    class BooksController < BaseController
      
      def index
        @books = Book.includes(:author).all

        # Фільтрація
        @books = @books.where("title ILIKE ?", "%#{params[:title]}%") if params[:title].present?
        @books = @books.where(author_id: params[:author_id]) if params[:author_id].present?

        # Сортування
        @books = @books.order(created_at: :desc)

        # Пагінація (через Kaminari)
        @books = @books.page(page_params[:page]).per(page_params[:per_page])

        # Метадані пагінації
        @pagination = {
          current_page: @books.current_page,
          next_page: @books.next_page,
          prev_page: @books.prev_page,
          total_pages: @books.total_pages,
          total_count: @books.total_count,
          per_page: page_params[:per_page]
        }

        # Jbuilder автоматично знайде app/views/api/v1/books/index.json.jbuilder
        render :index
      end
      
      def show
        @book = Book.includes(:author).find(params[:id])
        render :show
      end

      private

      def page_params
        {
          page: (params[:page] || 1).to_i,
          per_page: (params[:per_page] || 10).to_i
        }
      end
    end
  end
end
