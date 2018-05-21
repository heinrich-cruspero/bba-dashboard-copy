module Api
  module V1
    class BaseController < ActionController::Base
      before_action :restrict_access

      respond_to :json

      private

      def restrict_access
        authenticate_or_request_with_http_token do |token, _|
          token == ENV['API_TOKEN']
        end
      end
    end
  end
end
