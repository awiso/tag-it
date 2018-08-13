class CreateWalls < ActiveRecord::Migration[5.2]
  def change
    create_table :walls do |t|
      t.string :address
      t.text :description
      t.string :photo
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
