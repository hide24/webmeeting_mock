class CreateExternalServices < ActiveRecord::Migration[6.1]
  def change
    create_table :external_services do |t|
      t.string :service_name
      t.boolean :enabled
      t.text :extras

      t.timestamps
    end
  end
end
