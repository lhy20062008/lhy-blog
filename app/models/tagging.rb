class Tagging < ActiveRecord::Base
  validate_uniqueness :name
end
