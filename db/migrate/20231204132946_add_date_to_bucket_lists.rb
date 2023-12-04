class AddDateToBucketLists < ActiveRecord::Migration[7.0]
  def change
    add_column :bucket_lists, :date, :date
  end
end
