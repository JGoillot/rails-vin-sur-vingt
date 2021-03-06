class Cellar < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :conversations, dependent: :destroy

  validates :description, presence: true
  validates :address, presence: true
  validates :price_per_month, presence: true
  validates :kind, presence: true

  has_attachments :photos, maximum: 3

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def any_reviews?
    self.reservations.any? { |reservation| reservation.review.present? }
  end

end
