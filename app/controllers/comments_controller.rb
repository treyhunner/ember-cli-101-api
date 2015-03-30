class CommentsController < ApplicationController
  def index
    if params[:blog_post_id]
      blog_post = BlogPost.find(params[:blog_post_id])
      comments = Comment.where(blog_post_id: blog_post.id).order(created_at: :desc)
    else
      comments = Comment.order(created_at: :desc)
    end
    comments = comments.paginate(page: params[:page], per_page: 10)
    render json: comments, meta: { pages: comments.total_pages }
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
