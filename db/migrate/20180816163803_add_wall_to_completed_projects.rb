class AddWallToCompletedProjects < ActiveRecord::Migration[5.2]
  def change
    add_reference :completed_projects, :wall, foreign_key: true
  end
end
