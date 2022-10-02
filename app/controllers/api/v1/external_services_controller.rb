class Api::V1::ExternalServicesController < ApplicationController
  before_action :set_external_service, only: %i[ show update destroy ]

  # GET /api/v1/external_services
  def index
    @external_services = ExternalService.all
  end

  # GET /api/v1/external_services/1
  def show
  end

  # POST /api/v1/external_services
  def create
    @external_service = ExternalService.new(external_service_params)

    if @external_service.save
      render :show, status: :created, location: @external_service
    else
      render json: @external_service.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/external_services/1
  def update
    if @external_service.update(external_service_params)
      render :show, status: :ok, location: @external_service
    else
      render json: @external_service.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/external_services/1
  def destroy
    @external_service.destroy

    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_external_service
      @external_service = ExternalService.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def external_service_params
      params.require(:external_service).permit(:service_name, :enabled, :extras)
    end
end
