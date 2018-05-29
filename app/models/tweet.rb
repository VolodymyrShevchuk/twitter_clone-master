class Tweet < ApplicationRecord

  belongs_to :user

  has_many :likes

  validates :text, length: { minimum: 2 }, on: :create

end
