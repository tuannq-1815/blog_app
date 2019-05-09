class User < ApplicationRecord
  has_many :entries
  has_many :comments
end
