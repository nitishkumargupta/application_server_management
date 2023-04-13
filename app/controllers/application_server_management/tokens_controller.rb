module ApplicationServerManagement
  class TokensController < ::ApplicationController
    before_action :set_application_server, only: %i[ regenerate_token retrieve_token]

    def regenerate_token
      token = ApplicationServerManagement::TokenCreator.new(@application).regenerate_token
      token.save
      render json: token.to_json , status: 200
    end

    def retrieve_token
      token = @application.tokens.where(is_active: true).last
      render json: token.to_json , status: 200
    end

    def get_application_using_token
      token = Token.find_by(access_token: params["token"])
      if token.present?
        render json: token.application_server.to_json, status: 200
      else
        render json: "", status: 404
      end
    end

    private

      def set_application_server
        @application = ApplicationServer.find(params[:id])
      end

  end
end
