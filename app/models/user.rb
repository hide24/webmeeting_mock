class User < ApplicationRecord
  has_many :users_external_services
  has_many :external_services, through: :users_external_services
  has_many :meetings
end
