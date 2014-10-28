class Goal < ActiveRecord::Base
  belongs_to :category
  belongs_to :list

  mount_uploader :image_url, ImageUploader
end
