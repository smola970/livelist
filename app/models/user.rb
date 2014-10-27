class User < ActiveRecord::Base
  has_secure_password

  validates :username, :uniqueness => true
  validates :username, :presence => true
  # validates :username, :length => { :in => 5..30 :message => "Your username must be between five and thirty characters" }
  validates :username, format: { without: /\s/ }
  validates :password_confirmation, :presence => true
end
