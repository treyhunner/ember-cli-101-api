class CommentsRelationshipBlogPost < ActiveRecord::Migration
  def change
    add_reference :blog_posts, :comments, index: true
  end
end
