class BottleLot < ApplicationRecord
  belongs_to :user
  has_many :reservation_bottles
  has_many :reservations, through: :reservation_bottles

  validates :year, presence: true
  validates :appelation, presence: true
  validates :quantity, presence: true

end
