class CreateConferenceRoom < ActiveRecord::Migration[5.1]
  def change
    create_table :conference_rooms do |t|
      t.integer :room_number
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
