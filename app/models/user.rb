class User < ApplicationRecord
  has_secure_password

  # validates :email, :first_name, :last_name, :password, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
  validates_confirmation_of :password,  on: :create
  validates :password, length: { minimum: 2 }, on: :create
  has_many :tweets

  mount_uploader :avatar, AvatarUploader
  
  has_many :follows
  has_many :followed_users, through: :follows
  has_many :followers, through: :follows, inverse_of: :follower
end
