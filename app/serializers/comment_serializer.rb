class CommentSerializer < ActiveModel::Serializer
  attributes :id, :blog_post_id, :content
end
