class AddAnotherMailToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :another_mail, :boolean, defalut: false
  end
end
