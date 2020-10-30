class Gossip < ApplicationRecord

  validates :title, presence: true, length: { in: 3..14, message: "Please enter between 3 to 14 characters" }
  validates :content, presence: true

  belongs_to :user
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :join_table_tag_gossips
  has_many :tags, through: :join_table_tag_gossips

end
