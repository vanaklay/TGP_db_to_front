class PrivateMessage < ApplicationRecord

  validates :content, presence: true, length: { in: 2..140 }
  belongs_to :sender, class_name: "User"
  has_many :jt_pm_recipients
  has_many :recipients, through: :jt_pm_recipients
end
