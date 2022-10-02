class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :display_name
      t.string :given_name
      t.string :surname
      t.string :mail
      t.boolean :guest

      t.timestamps
    end
  end
end
