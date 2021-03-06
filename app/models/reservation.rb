class Reservation < ApplicationRecord
  belongs_to :cellar
  belongs_to :user
  has_many :reservation_bottles
  has_many :bottle_lots, through: :reservation_bottles

  validates :check_in, presence: true
  validates :check_out, presence: true

end
