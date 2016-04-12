class Post < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :tags, as: :tagable
  belongs_to :user
  has_many :articles
end
