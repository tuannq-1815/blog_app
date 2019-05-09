class Entry < ApplicationRecord
  has_many :comments
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: Settings.max_post_length }

  scope :feed_entry, ->{order created_at: :desc}
end
