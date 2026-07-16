module Api
  class ApiController < ApplicationController
    before_action :load_current_user
    rescue_from ActiveRecord::RecordNotFound, with: :not_found

      private

      def not_found(exception)
        render json: { error: exception.message }, status: :not_found
      end


      def load_current_user
        token = request.headers["Authorization"]
        return if token.nil?
        token = token.strip().delete_prefix("Bearer ")
        Rails.logger.info("TOKEN  #{token.inspect}")
      end
  end
end
