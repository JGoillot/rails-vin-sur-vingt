class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :messages, dependent: :destroy
  has_many :reservations
  has_many :bottle_lots
  has_many :cellars, dependent: :destroy

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :birthdate, presence: true
  # validates :birthdate, timeliness: { on_or_before: lambda { Date.current }, type: :date }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
