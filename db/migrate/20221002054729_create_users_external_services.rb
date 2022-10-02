class CreateUsersExternalServices < ActiveRecord::Migration[6.1]
  def change
    create_table :users_external_services do |t|
      t.integer :user_id
      t.integer :external_service_id
      t.string :external_mail

      t.timestamps
    end
  end
end
