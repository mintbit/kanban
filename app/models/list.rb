class List < ApplicationRecord
  belongs_to :board

  has_many :cards, -> { order(position: :asc) }

  acts_as_list scope: :board_id, top_of_list: 0, sequential_updates: true

  validates :title, presence: true

  after_create_commit do
    broadcast_before_to board, target: "list_form_board_#{board.id}"
  end

  after_destroy_commit do
    broadcast_remove_to board
  end

  after_update_commit do
    if saved_change_to_position?
      board.refresh_board
    elsif saved_changes?
      broadcast_replace_to board
    end
  end

  def refresh_list
    broadcast_replace_to board
  end
end
