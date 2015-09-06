class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = current_user.posts.build post_params
    if post.save
      redirect_to root_path
    else
      render :edit
    end
  end

  private
    def post_params
      params.require(:post).permit(:url, :title)
    end
end
