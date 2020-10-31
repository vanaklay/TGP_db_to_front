class User < ApplicationRecord
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
  validates :description, presence: true
  validates :age, presence: true
  validates :password, presence: true, length: { minimum: 6 }

  belongs_to :city
  has_many :gossips
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :jt_pm_recipients
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage", through: :jt_pm_recipients

  def remember(remember_token)
    remember_digest = BCrypt::Password.create(remember_token)
    self.update_attribute(:remember_digest, remember_digest)
  end
end
