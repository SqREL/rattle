module Posts::CommentsHelper
  def comments_tree_for(comments)
    comments.map do |comment, nested_comments|
      render('posts/comments/comment', comment: comment, nested_comments: nested_comments)
    end.join.html_safe
  end
end
