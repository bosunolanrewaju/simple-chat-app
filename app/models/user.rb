class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save { self.email = email.downcase }

  has_many :chats, foreign_key: :sender_id

  enum role: [:user, :trainer, :admin]

  def name_with_role
    "#{name} - #{role.capitalize}"
  end

  def name
    "#{first_name} #{last_name}"
  end
end
