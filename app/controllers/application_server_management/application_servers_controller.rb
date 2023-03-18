module ApplicationServerManagement
  class ApplicationServersController < ApplicationController
    before_action :set_application_server, only: %i[ show edit update destroy ]

    # GET /application_servers
    def index
      application_servers = ApplicationServer.all
      result = application_servers.map{|server| {id: server.id, name: server.name, code: server.code}}
      render json: { result: result }, status: 200
    end

    # GET /application_servers/1
    def show
      result = {id: @application_server.id, name: @application_server.name, code: @application_server.code}
      render json: { result: result }, status: 200
    end

    # GET /application_servers/new
    def new
      @application_server = ApplicationServer.new
    end

    # GET /application_servers/1/edit
    def edit
    end

    # POST /application_servers
    def create
      application_server = ApplicationServer.new(application_server_params)

      if application_server.save
        result = {id: application_server.id, name: application_server.name, code: application_server.code}
        render json: { result: result }, status: 200
      else
        render json: { result: "" }, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /application_servers/1
    def update
      if @application_server.update(application_server_params)
        result = {id: @application_server.id, name: @application_server.name, code: @application_server.code}
        render json: { result: result }, status: 200
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
      # Use callbacks to share common setup or constraints between actions.
      def set_application_server
        @application_server = ApplicationServer.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def application_server_params
        params.require(:application_server).permit(:name, :code, :description)
      end
  end
end
