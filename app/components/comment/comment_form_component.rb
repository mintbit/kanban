class Comment::CommentFormComponent < ApplicationComponent

  def initialize(comment:)
    @comment = comment
    @card = @comment.card
  end
end
