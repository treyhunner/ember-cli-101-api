class BlogPostsController < ApplicationController
  def index
    render json: BlogPost.all
  end

  def show
    @blog_post = BlogPost.find(params[:id])
    render json: @blog_post
  end

  def create
    @blog_post = BlogPost.create(post_params)
    render json: @blog_post
  end

  private
    def post_params
      params.require(:blog_post).permit(:title,:body,:published_date)
    end
end
