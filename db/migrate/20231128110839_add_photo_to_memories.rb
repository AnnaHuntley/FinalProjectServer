class AddPhotoToMemories < ActiveRecord::Migration[7.0]
  def change
    add_column :memories, :photo, :string
  end
end

