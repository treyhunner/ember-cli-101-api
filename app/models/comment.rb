class Comment < ActiveRecord::Base
  has_one :blog_post
end
