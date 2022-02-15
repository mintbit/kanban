class Comment::EditCommentComponent < ApplicationComponent

  def initialize(comment:)
    @comment = comment
    @card = @comment.card
  end
end
