class Comment::CommentShowComponent < ApplicationComponent

  def initialize(comment:)
    @comment = comment
    @card = @comment.card
  end
end
