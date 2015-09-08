class Posts::CommentsController < ApplicationController
  def create
    comment = Comment.create!(comment_params.merge({post_id: params[:post_id], owner: current_user}))
    redirect_to :back
  end

  def comment_params
    params.require(:comment).permit(:body, :parent_id)
  end
end
