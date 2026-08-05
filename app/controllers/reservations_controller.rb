class ReservationsController < ApplicationController
  allow_unauthenticated_access only: :create

  before_action :set_reservation, only: %i[edit update destroy]

  def create
    @screening = Screening.find(params[:screening_id])
    @reservation = @screening.reservations.new(reservation_params)

    if @reservation.save
      redirect_to screening_path(@screening),
                  notice: "Reservation was created.",
                  status: :see_other
    else
      render "screenings/show", status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @reservation.update(reservation_params)
      redirect_to admin_path,
                  notice: "Reservation was updated.",
                  status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @reservation.destroy!

    redirect_to admin_path,
                notice: "Reservation was deleted.",
                status: :see_other
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.expect(
      reservation: [
        :email_address,
        :number_of_seats
      ]
    )
  end
end