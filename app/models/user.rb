class User < ApplicationRecord
  validates :nickname, uniqueness: true, presence: true

  has_many :messages, as: :author
  has_many :messages, as: :listener
end
