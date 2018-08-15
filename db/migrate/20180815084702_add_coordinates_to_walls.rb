class AddCoordinatesToWalls < ActiveRecord::Migration[5.2]
  def change
    add_column :walls, :latitude, :float
    add_column :walls, :longitude, :float
  end
end
