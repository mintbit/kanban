class Card < ApplicationRecord
  belongs_to :list

  has_many :comments
  has_many :tasks

  has_many_attached :attachments, dependent: :destroy

  acts_as_list scope: :list_id, top_of_list: 0, sequential_updates: true

  attr_accessor :previous_list_id

  validates :title, presence: true

  after_create_commit do
    broadcast_append_to list.board, target: "list-cards-#{list.id}"
  end

  after_update_commit do
    if moved?
      refresh_affected_lists
    elsif attachment_changes.any?
      refresh_attachments
    else
      broadcast_replace_to list.board
    end
  end

  after_destroy_commit do
    broadcast_remove_to list.board
  end

  def moved?
    saved_change_to_list_id? || saved_change_to_position?
  end

  private
    def refresh_attachments
      broadcast_replace_to self, target: "attachment_card_#{id}", partial: 'cards/attachments', locals: { card: self }
    end

    def refresh_affected_lists
      list.refresh_list
      List.find(previous_list_id)&.refresh_list if saved_change_to_list_id?
    end
end
