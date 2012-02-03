class AddListPositionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :list_position, :integer
  end
end
