class AddUserIdsToMeetings < ActiveRecord::Migration[6.1]
  def change
    add_column :meetings, :user_ids, :text
  end
end
