module Api
  class ApiController < ApplicationController
    before_action :load_current_user
    before_action :authorize_user
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
        result = HydraAdminApiClient.introspect(token: token)
        if result["active"]
          @current_user = result["sub"]
          Rails.logger.info("Current User #{@current_user}")
        end
      end

      def authorize_user
        if @current_user.nil?
          render json: { error: "Unauthorized" }, status: :unauthorized

        end
      end

    def authorize_admin!

      unless Role.exists?(user_id: @current_user, role: ["admin", "owner"])
        render json: { error: "Forbidden"}, status: :forbidden
      end


    end
  end
end
