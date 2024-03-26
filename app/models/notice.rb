class Notice < ApplicationRecord
  after_create_commit { broadcast_append_to "notifications" }
  after_create :notify_users
    acts_as_paranoid
    belongs_to :category
    has_one_attached :image
    attribute :title, :string
  
    validates :title, presence: true, length: { maximum: 255 }
    validates :content, presence: true
    validates :category_id, presence: true

    def notify_users
        ActionCable.server.broadcast("notifications_channel", {
            title: self.title,
            content: self.content
        })
      end
end
