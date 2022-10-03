class ExternalServicesController < ApplicationController
  before_action :set_external_service, only: %i[ show edit update destroy ]

  # GET /external_services or /external_services.json
  def index
    @external_services = ExternalService.order(service_name: :asc).all
  end

  # GET /external_services/1 or /external_services/1.json
  def show
  end

  # GET /external_services/new
  def new
    @external_service = ExternalService.new
  end

  # GET /external_services/1/edit
  def edit
  end

  # POST /external_services or /external_services.json
  def create
    @external_service = ExternalService.new(external_service_params)

    respond_to do |format|
      if @external_service.save
        format.html { redirect_to external_service_url(@external_service), notice: "External service was successfully created." }
        format.json { render :show, status: :created, location: @external_service }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @external_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /external_services/1 or /external_services/1.json
  def update
    respond_to do |format|
      if @external_service.update(external_service_params)
        format.html { redirect_to external_service_url(@external_service), notice: "External service was successfully updated." }
        format.json { render :show, status: :ok, location: @external_service }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @external_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /external_services/1 or /external_services/1.json
  def destroy
    @external_service.destroy

    respond_to do |format|
      format.html { redirect_to external_services_url, notice: "External service was successfully destroyed." }
      format.json { head :no_content }
    end
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
