class ChangeUserInBucketLists < ActiveRecord::Migration[7.0]
  def change
    change_column :bucket_lists, :user_id, :integer, null: true
  end
end

