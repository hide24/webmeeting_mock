json.extract! external_service, :id, :service_name, :enabled, :extras, :created_at, :updated_at
json.url external_service_url(external_service, format: :json)
