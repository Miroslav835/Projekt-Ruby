class Movie < ApplicationRecord
  has_many :screenings, dependent: :destroy

  validates :name,
            presence: true,
            uniqueness: { case_sensitive: false }

  validates :genre, presence: true

  validates :duration,
            presence: true,
            numericality: {
              only_integer: true,
              greater_than: 0
            }

  validates :start_date, presence: true
  validates :end_date, presence: true

  validate :end_date_must_be_after_start_date

  private

  def end_date_must_be_after_start_date
    return if start_date.blank? || end_date.blank?

    if end_date <= start_date
      errors.add(:end_date, "must be after start date")
    end
  end
end