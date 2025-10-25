module Api
  module V1
    class BaseController < ActionController::API
    
      rescue_from ActiveRecord::RecordNotFound, with: :not_found
      
      private
      
      def not_found
        render json: { error: 'Record not found' }, status: :not_found
      end
    
      def page_params
        {
          page: params[:page] || 1,
          per_page: [params.fetch(:per_page, 10).to_i, 100].min
        }
      end
    end
  end
end