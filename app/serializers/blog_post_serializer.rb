class BlogPostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :published_date
  has_many :comments, embed: :id
end
