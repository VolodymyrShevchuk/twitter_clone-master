class Like < ApplicationRecord
  validates :tweet_id, :user_id, presence: true
  validates_uniqueness_of :user_id, scope: :tweet_id

  belongs_to :tweet
  belongs_to :user
end
