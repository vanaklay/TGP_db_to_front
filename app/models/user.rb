class User < ApplicationRecord

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
  validates :description, presence: true
  validates :age, presence: true

  belongs_to :city
  has_many :gossips
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :jt_pm_recipients
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage", through: :jt_pm_recipients
end
