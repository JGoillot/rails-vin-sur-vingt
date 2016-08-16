class Message < ApplicationRecord
  belongs_to :user
  belongs_to :cellar

  validates :content, presence: true
end
