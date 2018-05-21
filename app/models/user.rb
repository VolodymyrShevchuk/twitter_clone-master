class User < ApplicationRecord
  has_secure_password

  validates :email, :first_name, :last_name, :password, presence: true, on: :create
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
  validates_confirmation_of :password,  on: :create
  validates :password, length: { minimum: 2 }, on: :create

  mount_uploader :avatar, AvatarUploader

  has_many :tweets

  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy


  has_many :passive_relationships,  class_name: "Relationship",
                                    foreign_key: "followed_id",
                                    dependent: :destroy

  has_many :followings, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships

  def follow(follower, followed)
    active_relationships.create(follower_id: follower.id, followed_id: followed.id)


  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    followings.include?(other_user)
  end


end
