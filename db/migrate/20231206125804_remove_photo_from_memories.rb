class RemovePhotoFromMemories < ActiveRecord::Migration[7.0]
  def change
    remove_column :memories, :photo, :string
  end
end

