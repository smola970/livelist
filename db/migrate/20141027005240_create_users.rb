class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :display_name
      t.string :email
      t.string :profile_image_url
      t.string :cover_image_url
      t.string :instagram_username
      t.integer :instagram_id
      t.string :instagram_profile_image

      t.timestamps
    end
  end
end
