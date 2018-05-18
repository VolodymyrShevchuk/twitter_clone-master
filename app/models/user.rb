class User < ApplicationRecord
  has_secure_password

  # validates :email, :first_name, :last_name, :password, presence: true
  # validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  # validates_confirmation_of :password
  # validates :password, length: { minimum: 2 }

  has_many :tweets

  mount_uploader :avatar, AvatarUploader
end
