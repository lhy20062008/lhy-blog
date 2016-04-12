class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
  belongs_to :user

  def as_json
  	{
  		name: user.name,
  		body: body,
  		id: id
  	}
  end
end
