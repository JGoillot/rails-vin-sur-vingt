class Message < ApplicationRecord
  belongs_to :user
  belongs_to :cave

  validates :content, presence: true
end
