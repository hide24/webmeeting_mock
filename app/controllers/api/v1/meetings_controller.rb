class Api::V1::MeetingsController < ApplicationController
  before_action :set_meeting, only: %i[ show update destroy ]

  # GET /api/v1/meetings
  def index
    @meetings = Meeting.all
  end

  # GET /api/v1/meetings/1
  def show
  end

  # POST /api/v1/meetings
  def create
    @meeting = Meeting.new(meeting_params)

    if @meeting.save
      render :show, status: :created, location: @meeting
    else
      render json: @meeting.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/meetings/1
  def update
    if @meeting.update(meeting_params)
      render :show, status: :ok, location: @meeting
    else
      render json: @meeting.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/meetings/1
  def destroy
    @meeting.destroy

    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def meeting_params
      params.require(:meeting).permit(:user_ids, :external_service_id, :title, :description, :start_at, :end_at, :extras)
    end
end