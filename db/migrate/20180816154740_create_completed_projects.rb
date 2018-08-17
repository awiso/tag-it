class CreateCompletedProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :completed_projects do |t|
      t.string :name
      t.string :description
      t.string :collaborators
      t.string :photo
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
