class Post < ActiveRecord::Base
  extend FriendlyId
  include PgSearch

  friendly_id :title, use: [:slugged, :finders]
  pg_search_scope :search_by_title, :against => :title

  belongs_to :owner, foreign_key: 'owner_id', class_name: 'User'
  has_many   :comments
  has_many   :votes

  validates :title, :url, presence: true

  delegate :name_or_email, to: :owner, prefix: true

  scope :voted_for_in_last, -> (time_ago) { joins(:votes).where('votes.created_at > ?', time_ago) }

  def humanized_rating
    (rating * 100).round
  end
end
