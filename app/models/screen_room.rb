class ScreenRoom < ApplicationRecord
  has_many :screenings, dependent: :restrict_with_error

  validates :room_number,
            presence: true,
            numericality: { only_integer: true, greater_than: 0 },
            uniqueness: true

  validates :number_of_seats,
            presence: true,
            numericality: { only_integer: true, greater_than: 0 }
end