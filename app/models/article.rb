class Article < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :taggings, as: :tagable
  has_many :tags, through: :taggings
  belongs_to :user
  belongs_to :post

  def do_tags(tag_ids)
    return if tag_ids.blank?
    tags.delete_all
    Tag.where(id: tag_ids).each do |tag|
      Tagging.find_or_create_by(tagable_id: id, tagable_type: 'Article', tag_id: tag.id)
    end
  end
end
