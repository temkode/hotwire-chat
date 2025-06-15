class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user

  validates :content, presence: true, length: { maximum: 2000 }

  scope :recent, -> { order(created_at: :desc).take(50).reverse }

  after_create_commit -> { broadcast_replace_later_to [ room, "messages" ],
                                                      partial: "rooms/messages",
                                                      target: "messages",
                                                      locals: {
                                                        room: room
                                                      } }
end
