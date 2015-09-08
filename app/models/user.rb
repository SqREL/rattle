class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts,    foreign_key: 'owner_id'
  has_many :comments, foreign_key: 'owner_id'
  has_many :votes

  def name_or_email
    name.presence || email
  end

  def vote_for(post, direction)
    votes.where(post: post).first_or_create(direction: direction)
  end
end
