module Api
  module V1
    class AuthorsController < BaseController
      def index
        @authors = Author.includes(:books).all
       
        if params[:name].present?
          @authors = @authors.where("name ILIKE ?", "%#{params[:name]}%")
        end
        
        if params[:active].present?
          @authors = @authors.where(active: params[:active])
        end
        
        @authors = @authors.order(:name)
        
        @authors = @authors.page(page_params[:page]).per(page_params[:per_page])
        
        @pagination = {
          current_page: @authors.current_page,
          next_page: @authors.next_page,
          prev_page: @authors.prev_page,
          total_pages: @authors.total_pages,
          total_count: @authors.total_count,
          per_page: page_params[:per_page]
        }
      end
      
      def show
        @author = Author.includes(:books).find(params[:id])
      end
    end
  end
end