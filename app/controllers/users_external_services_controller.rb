class UsersExternalServicesController < ApplicationController
  before_action :set_users_external_service, only: %i[ show edit update destroy ]

  # GET /users_external_services or /users_external_services.json
  def index
    @users_external_services = UsersExternalService.all
  end

  # GET /users_external_services/1 or /users_external_services/1.json
  def show
  end

  # GET /users_external_services/new
  def new
    @users_external_service = UsersExternalService.new
  end

  # GET /users_external_services/1/edit
  def edit
  end

  # POST /users_external_services or /users_external_services.json
  def create
    @users_external_service = UsersExternalService.new(users_external_service_params)

    respond_to do |format|
      if @users_external_service.save
        format.html { redirect_to users_external_service_url(@users_external_service), notice: "Users external service was successfully created." }
        format.json { render :show, status: :created, location: @users_external_service }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @users_external_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users_external_services/1 or /users_external_services/1.json
  def update
    respond_to do |format|
      if @users_external_service.update(users_external_service_params)
        format.html { redirect_to users_external_service_url(@users_external_service), notice: "Users external service was successfully updated." }
        format.json { render :show, status: :ok, location: @users_external_service }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @users_external_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users_external_services/1 or /users_external_services/1.json
  def destroy
    @users_external_service.destroy

    respond_to do |format|
      format.html { redirect_to users_external_services_url, notice: "Users external service was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_external_service
      @users_external_service = UsersExternalService.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def users_external_service_params
      params.require(:users_external_service).permit(:user_id, :external_service_id, :external_mail)
    end
end
