json.extract! meeting, :id, :external_service_id, :title, :description, :start_at, :end_at, :extras, :created_at, :updated_at, :uids
json.url meeting_url(meeting, format: :json)
