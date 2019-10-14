class Message < ApplicationRecord
  belongs_to :listener, polymorphic: true
  belongs_to :author, class_name: 'User'
end
