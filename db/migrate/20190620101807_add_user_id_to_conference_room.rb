class AddUserIdToConferenceRoom < ActiveRecord::Migration[5.1]
  def change
    add_column :conference_rooms, :user_id, :integer
  end
end
