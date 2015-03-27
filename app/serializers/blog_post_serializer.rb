class BlogPostSerializer < ActiveModel::Serializer
  embed :ids, embed_in_root: true
  attributes :id, :title, :body, :published_date
end
