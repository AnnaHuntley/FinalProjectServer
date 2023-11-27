class CreateAchievements < ActiveRecord::Migration[7.0]
  def change
    create_table :achievements do |t|
      t.string :title
      t.text :description
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end

