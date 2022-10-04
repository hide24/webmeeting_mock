json.extract! user, :id, :display_name, :given_name, :surname, :mail, :guest, :another_mail, :created_at, :updated_at
json.url api_v1_user_url(user, format: :json)
