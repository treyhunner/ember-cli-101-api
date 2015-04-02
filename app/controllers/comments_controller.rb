class CommentsController < ApplicationController
  def index
    comments = if params[:blog_post_id]
      blog_post = BlogPost.find(params[:blog_post_id])
      Comment.where(blog_post_id: blog_post.id)
    else
      Comment
    end.order(created_at: :desc)

    if params[:ids]
      comments = comments.where(id: params[:ids])
    end

    render json: comments
  end

  def show
    comment = Comment.find(params[:id])
    render json: comment
  end

  def create
    if comments_params[:blog_post_id]
      blog_post = BlogPost.find(comments_params[:blog_post_id])
      comment = blog_post.comments.new(content: comments_params[:content])
      comment.save
    end
    render json: comment
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    render json: comment
  end

  private
    def comments_params
      params.require(:comment).permit(:content, :blog_post_id)
    end
end
