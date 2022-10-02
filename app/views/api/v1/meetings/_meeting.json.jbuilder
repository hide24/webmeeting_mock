json.extract! meeting, :id, :user_id, :external_service_id, :title, :description, :start_at, :end_at, :extras, :created_at, :updated_at
json.url api_v1_meeting_url(meeting, format: :json)
