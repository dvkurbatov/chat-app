class Message < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  belongs_to :user
end
