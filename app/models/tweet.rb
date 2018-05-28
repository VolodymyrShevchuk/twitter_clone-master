class Tweet < ApplicationRecord

  belongs_to :user

  has_many :likes

  validates :text, presence: true, length: { minimum: 5 }



end
