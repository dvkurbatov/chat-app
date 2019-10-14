class User < ApplicationRecord
  validates :nickname, uniqueness: true, presence: true

  has_many :messages, as: :author
  has_many :messages, as: :listener

  scope :all_except, ->(user) { where.not(id: user) }

  def appear
    self.update(online_status: true)
    ActionCable.server.broadcast "users",
        action: 'appear',
        id: id
  end

  def away
    self.update(online_status: false)
    ActionCable.server.broadcast "users",
        action: 'away',
        id: id
  end
end
