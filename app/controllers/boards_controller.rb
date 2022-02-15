class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :update]

  def update
    if @board.update(board_params)
      head :ok
    else
      redirect_to root_path
    end
  end

  private
    def set_board
      @board = Board.first_or_create
    end

    def board_params
      params.require(:board).permit(:title)
    end
end
