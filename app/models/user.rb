class User < ActiveRecord::Base
  has_secure_password
  has_many :lists

  acts_as_followable
  acts_as_follower

  validates :username, :uniqueness => true
  validates :username, :presence => true
  # # validates :username, :length => { :in => 5..30 :message => "Your username must be between five and thirty characters" }
  # validates :username, format: { without: /\s/ }
  # # validates :password_confirmation, :presence => true

  mount_uploader :cover_image_url, ImageUploader
  mount_uploader :profile_image_url, ImageUploader
end
