class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts,    foreign_key: 'owner_id'
  has_many :comments, foreign_key: 'owner_id'
end
