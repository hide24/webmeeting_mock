class UsersExternalService < ApplicationRecord
  belongs_to :user
  belongs_to :external_service
end
