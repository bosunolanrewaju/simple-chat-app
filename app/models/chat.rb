class Chat < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  validates :message, presence: true

  def self.users_messages(user_id)
    where("sender_id = ? OR receiver_id = ?", user_id, user_id).order('created_at DESC')
  end
end
