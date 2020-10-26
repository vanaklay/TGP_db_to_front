class User < ApplicationRecord
  belongs_to :city
  has_many :gossips
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :jt_pm_recipients
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage", through: :jt_pm_recipients
end
