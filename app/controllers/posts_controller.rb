class PostsController < ApplicationController
  def index
    @posts = Post.order('rating DESC').page(params[:page]).per(10)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build post_params
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  # Please, think of this as a stub method.
  # There's no free account for elasticsearch on Heroku
  def search
    @posts = Post.search_by_title(params[:criterium]).page(params[:page]).per(10)
  end

  private
    def post_params
      params.require(:post).permit(:url, :title)
    end
end
