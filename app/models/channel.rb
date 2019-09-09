class Channel < ApplicationRecord
  validates :title, uniqueness: true, presence: true

  has_many :messages, as: :imageable
end
