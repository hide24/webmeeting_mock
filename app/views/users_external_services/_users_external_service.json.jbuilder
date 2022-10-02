json.extract! users_external_service, :id, :user_id, :external_service_id, :external_mail, :created_at, :updated_at
json.url users_external_service_url(users_external_service, format: :json)
