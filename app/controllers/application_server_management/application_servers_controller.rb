module ApplicationServerManagement
  class ApplicationServersController < ::ApplicationController
    include RoleCheck
    include PaginationAndSorting
    include ResponseHeaders
    before_action -> { check_role_permissions(['ROLE_ORGANIZATION_ADMIN']) }
    before_action :set_application_servers
    before_action :set_application_server, only: %i[ show edit update destroy ]

    # GET /application_servers
    def index
      query = params[:query]
      q = params[:q]
      application_servers = @application_servers.ransack(q).result
      render json: application_servers.to_json, status: 200
    end

    # GET /application_servers/1
    def show
      render json: @application_server.to_json, status: 200
    end
    
    # POST /application_servers
    def create
      application_server = ApplicationServer.new(application_server_params)
      application_server.organisation_id = @current_user.organisation_id
      if params[:alert_response_codes].is_a?(String)
        application_server.alert_response_codes = [params[:alert_response_codes]]
      elsif params[:alert_response_codes].is_a?(Array)
        application_server.alert_response_codes = params[:alert_response_codes]
      end
      ApplicationServerManagement::TokenCreator.new(application_server).create_token
      if application_server.save
        render json: application_server.to_json, status: 200
      else
        render json: { result: "" }, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /application_servers/1
    def update
      if params[:alert_response_codes].is_a?(String)
        @application_server.alert_response_codes = [params[:alert_response_codes]]
      elsif params[:alert_response_codes].is_a?(Array)
        @application_server.alert_response_codes = params[:alert_response_codes]
      end
      if @application_server.update(application_server_params)
        render json: @application_server.to_json, status: 200
      else
        render json: { result: "" }, status: :unprocessable_entity
      end
    end

    # DELETE /application_servers/1
    def destroy
      @application_server.destroy
      render json: { result: "" }, status: 200
    end

    private

      def set_application_servers
        @application_servers = @current_user&.organisation&.application_servers
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_application_server
        @application_server = @application_servers.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def application_server_params
        params.require(:application_server).permit(:name, :code, :description)
      end
  end
end
