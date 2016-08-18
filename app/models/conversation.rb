class Conversation < ApplicationRecord
  belongs_to :user
  belongs_to :cellar
  has_many :messages
end
