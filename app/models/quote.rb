class Quote < ActiveRecord::Base
  attribure_accessible
  acts_as_taggable
  acts_as_taggable_on :tag_list
end
