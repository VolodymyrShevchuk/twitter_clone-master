class Tweet < ApplicationRecord
  validates :text, length: { minimum: 1, maximum: 140 }, on: :create

  belongs_to :user
  has_many :likes

  self.per_page = 5
end
