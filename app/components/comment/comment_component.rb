class Comment::CommentComponent < ApplicationComponent

  def initialize(comment:)
    @comment = comment
  end
end
