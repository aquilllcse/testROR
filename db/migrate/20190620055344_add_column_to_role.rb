class AddColumnToRole < ActiveRecord::Migration[5.1]
  def change
    add_column :roles, :created_at, :datetime
    add_column :roles, :updated_at, :datetime
  end
end
