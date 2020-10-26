class PrivateMessage < ApplicationRecord
  belongs_to :sender, class_name: "User"
  has_many :jt_pm_recipients
  has_many :recipients, through: :jt_pm_recipients
end
