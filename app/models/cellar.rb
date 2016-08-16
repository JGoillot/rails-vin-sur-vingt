class Cellar < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many :messages, dependent: :destroy

  validates :description, presence: true
  validates :address, presence: true
  validates :price_per_month, presence: true
  validates :kind, presence: true

end
