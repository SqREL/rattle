class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  scope :positive, ->{ where(direction: 'up') }
  validates :user_id, uniqueness: { scope: :post_id }
end
