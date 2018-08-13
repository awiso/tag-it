class AddNameToWall < ActiveRecord::Migration[5.2]
  def change
    add_column :walls, :name, :string
  end
end
