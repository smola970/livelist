class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.integer :original_goal_id
      t.string :text
      t.integer :user_id
      t.integer :list_id
      t.integer :category_id
      t.boolean :complete
      t.string :image_url
      t.string :caption

      t.timestamps
    end
  end
end
