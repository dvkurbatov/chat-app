class User < ApplicationRecord
  validates :nickname, uniqueness: true, presence: true

  has_many :messages
end
