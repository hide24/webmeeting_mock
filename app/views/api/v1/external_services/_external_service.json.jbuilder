json.extract! external_service, :id, :service_name, :enabled, :extras, :created_at, :updated_at
json.url api_v1_external_service_url(external_service, format: :json)
