class AddPhotoToMemories < ActiveRecord::Migration[6.1]
  def change
    add_column :memories, :photo, :attachment
  end
end
