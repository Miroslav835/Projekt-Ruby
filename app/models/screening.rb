class Screening < ApplicationRecord
  belongs_to :movie
  belongs_to :screen_room

  has_many :reservations, dependent: :destroy

  validates :starts_at, presence: true

  validate :starts_at_cannot_be_in_the_past, on: :create

  validates :starts_at,
            uniqueness: {
              scope: :screen_room_id,
              message: "already has a screening in this room"
            }

  def reserved_seats
    reservations.sum(:number_of_seats)
  end

  def available_seats
    screen_room.number_of_seats - reserved_seats
  end

  private

  def starts_at_cannot_be_in_the_past
    return if starts_at.blank?

    if starts_at < Time.current
      errors.add(:starts_at, "cannot be in the past")
    end
  end

end