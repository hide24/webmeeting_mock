class CreateMeetings < ActiveRecord::Migration[6.1]
  def change
    create_table :meetings do |t|
      t.integer :user_id
      t.integer :external_service_id
      t.string :title
      t.text :description
      t.datetime :start_at
      t.datetime :end_at
      t.text :extras

      t.timestamps
    end
  end
end
