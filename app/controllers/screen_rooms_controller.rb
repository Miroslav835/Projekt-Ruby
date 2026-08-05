class ScreenRoomsController < ApplicationController
  before_action :set_screen_room, only: %i[show edit update destroy]

  allow_unauthenticated_access only: %i[index show]

  def index
    @screen_rooms = ScreenRoom.all
  end

  def show
  end

  def new
    @screen_room = ScreenRoom.new
  end

  def create
    @screen_room = ScreenRoom.new(screen_room_params)

    if @screen_room.save
      redirect_to admin_path, notice: "Screen room was created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @screen_room.update(screen_room_params)
      redirect_to admin_path, notice: "Screen room was updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @screen_room.destroy
      redirect_to admin_path, notice: "Screen room was deleted."
    else
      redirect_to admin_path,
                  alert: @screen_room.errors.full_messages.first
    end
  end

  private

  def set_screen_room
    @screen_room = ScreenRoom.find(params[:id])
  end

  def screen_room_params
    params.expect(
      screen_room: [
        :room_number,
        :number_of_seats
      ]
    )
  end
end