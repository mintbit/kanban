class Comment::NewCommentComponent < ApplicationComponent

  def initialize(card:)
    @card = card
    @comment = @card.comments.build
  end
end
