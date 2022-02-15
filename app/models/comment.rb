class Comment < ApplicationRecord
  belongs_to :card

  after_create_commit do
    broadcast_append_to card, target: "card-comment-list-#{card.id}"
  end

  after_update_commit do
    broadcast_replace_to card
  end

  after_destroy_commit do
    broadcast_remove_to card
  end
end
