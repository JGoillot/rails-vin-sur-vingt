class ReservationsController < ApplicationController
  before_action :find_reservation, only: [:show]

  def new
    @cellar = Cellar.find(params[:cellar_id])
    @reservation = Reservation.new
  end

  def create
    @cellar = Cellar.find(params[:cellar_id])
    @reservation = current_user.reservations.new(reservation_params)
    @reservation.cellar = @cellar
    @reservation.save
    redirect_to cellar_reservation_path(@cellar, @reservation)
  end

  def show
    @reservation_bottles = ReservationBottle.new
    @cellar = Cellar.find(params[:cellar_id])
    @bottles_lot = current_user.bottle_lots
  end

  def destroy
  end

  def update
    @reservation = Reservation.find(params[:id])
    @reservation.update(review_params)
    raise
    @reservation.save
    redirect_to user_dashboard_path(current_user)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out)
  end

  def find_reservation
    @reservation = Reservation.find(params[:id])
  end

   def review_params
    params.require(:reservation).permit(:review)
  end

end
