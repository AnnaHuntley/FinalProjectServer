class CreateBucketLists < ActiveRecord::Migration[7.0]
  def change
    create_table :bucket_lists do |t|
      t.string :item
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
