class User < ApplicationRecord

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  belongs_to :city

  has_many :gossips
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :private_message_recipient_joins
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "private_message_recipient_join"
  has_many :likes
  
  def remember(remember_token)
    remember_digest = BCrypt::Password.create(remember_token)
    self.update(remember_digest: remember_digest)
  end

end
