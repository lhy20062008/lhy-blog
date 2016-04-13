class Post < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :taggings, as: :tagable
  has_many :tags, through: :taggings
  belongs_to :user
  has_many :articles

  def do_tags(tag_ids)
    return if tag_ids.blank?
    tags.delete_all
    Tag.where(id: tag_ids).each do |tag|
      Tagging.find_or_create_by(tagable_id: id, tagable_type: 'Post', tag_id: tag.id)
    end
  end
end
