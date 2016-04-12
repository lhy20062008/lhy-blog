class Article < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :tags, as: :tagable
  belongs_to :user
  belongs_to :post
end
