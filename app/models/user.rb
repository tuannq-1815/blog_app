class User < ApplicationRecord
  has_many :entries
  has_many :comments

  before_save {email.downcase!}

  validates :name, presence: true, length: { maximum: Settings.max_name_length }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: Settings.max_email_length },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: Settings.min_password_length }
  has_secure_password

  scope :order_by_name, ->{order name: :asc}
end
