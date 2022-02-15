class CommentsController < ApplicationController
  before_action :set_comment

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      # create.turbo_stream.slim
    else
      redirect_to root_path
    end
  end

  def update
    if @comment.update(comment_params)
      head :ok
    else
      redirect_to root_path
    end
  end

  def destroy
    @comment.destroy
    head :ok
  end

  private
    def set_comment
      @comment = Comment.find(params[:id]) if params[:id]
    end

    def comment_params
      params.require(:comment).permit(:card_id, :description)
    end
end
