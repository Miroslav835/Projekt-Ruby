class Reservation < ApplicationRecord
  belongs_to :screening

  validates :email_address, presence: true

  validates :number_of_seats,
            presence: true,
            numericality: {
              only_integer: true,
              greater_than: 0,
              less_than_or_equal_to: 10
            }

  validate :enough_available_seats

  private

  def enough_available_seats
    return if screening.nil? || number_of_seats.blank?

    if number_of_seats > screening.available_seats
      errors.add(
        :number_of_seats,
        "exceeds the number of available seats"
      )
    end
  end
end