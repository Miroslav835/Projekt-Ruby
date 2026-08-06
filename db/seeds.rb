Reservation.destroy_all
Screening.destroy_all
Movie.destroy_all
ScreenRoom.destroy_all

admin = User.find_or_initialize_by(email_address: "admin@example.com")

admin.password = "Admin123!"

admin.save!

room_1 = ScreenRoom.create!(
  room_number: 1,
  number_of_seats: 75
)

room_2 = ScreenRoom.create!(
  room_number: 2,
  number_of_seats: 150
)

terminator = Movie.create!(
  name: "Terminator",
  genre: "Sci-fi",
  duration: 107,
  description: "A science-fiction action film.",
  start_date: Date.new(2026, 8, 1),
  end_date: Date.new(2026, 9, 30)
)

total_recall = Movie.create!(
  name: "Total Recall",
  genre: "Sci-fi",
  duration: 113,
  description: "A science-fiction action film.",
  start_date: Date.new(2026, 8, 10),
  end_date: Date.new(2026, 10, 15)
)

screening_1 = Screening.create!(
  movie: terminator,
  screen_room: room_1,
  starts_at: DateTime.new(2026, 8, 10, 18, 30)
)

Screening.create!(
  movie: total_recall,
  screen_room: room_2,
  starts_at: DateTime.new(2026, 8, 11, 20, 0)
)

Reservation.create!(
  screening: screening_1,
  email_address: "example@example.com",
  number_of_seats: 2
)