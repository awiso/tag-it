class AddNameAndAvatarToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :avatar, :string
    add_column :users, :display_name, :string
  end
end
