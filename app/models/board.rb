class Board < ApplicationRecord
  has_many :lists, -> { order(position: :asc) }
  has_many :cards, through: :lists

  after_update_commit do
    if saved_change_to_title?
      broadcast_replace_to self, target: "title_board_#{id}", partial: 'boards/title', locals: { board: self }
    elsif saved_changes?
      board.refresh_board
    end
  end

  def refresh_board
    broadcast_update
  end
end
