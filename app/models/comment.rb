class Comment < ActiveRecord::Base
  has_closure_tree order: 'created_at DESC'

  belongs_to :owner, foreign_key: 'owner_id', class_name: 'User'
  belongs_to :post

  delegate :name_or_email, to: :owner, prefix: true

  validates :body, :owner, :post, presence: true
end
