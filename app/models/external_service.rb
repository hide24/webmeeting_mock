class ExternalService < ApplicationRecord
  has_many :users_external_services
  has_many :users, through: :users_external_services
  has_many :meetings
end
