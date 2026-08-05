class ScreeningsController < ApplicationController
  before_action :set_screening, only: %i[ show edit update destroy ]
  allow_unauthenticated_access only: %i[ index show]
  def index
    @screening = Screening.all
  end

  def show
    @reservation = @screening.reservations.new
  end

  def new
    @screening = Screening.new(movie_id: params[:movie_id])
  end

  def create
    @screening = Screening.new(screening_params)
    if @screening.save
      redirect_to admin_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
  end
  def update
    if @screening.update(screening_params)
      redirect_to admin_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @screening.destroy
    redirect_to admin_path
  end

  private
  def set_screening
    @screening = Screening.find(params[:id])
  end
  def screening_params
    params.expect(screening: [:starts_at, :movie_id, :screen_room_id])
  end
end
