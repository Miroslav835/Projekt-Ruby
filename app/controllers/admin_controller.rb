class AdminController < ApplicationController
  def index
    @movie = Movie.all
    @reservation = Reservation.all
    @screening_room = ScreenRoom.all
  end
end
