class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, class_name: 'Event', dependent: :destroy

  has_many :comments, class_name: 'Comment'#, dependent: :destroy
  has_many :likes, class_name: 'Likes'#, dependent: :destroy
  has_many :dislikes, class_name: 'Dislikes'#, dependent: :destroy


  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "encrypted_password", "id", "name", "phone_number", "remember_created_at", "reset_password_sent_at", "reset_password_token", "role", "updated_at"]
  end
end
