class Tagging < ActiveRecord::Base
  belongs_to :tagable, :polymorphic => true
  belongs_to :tag
end
