class Posts::VotesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    render json: { success: (current_user.vote_for(post, params[:vote]) if post.present?) }
  end
end
