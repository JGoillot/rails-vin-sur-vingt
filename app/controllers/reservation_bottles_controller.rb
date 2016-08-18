class ReservationBottlesController < ApplicationController

  def create
    @reservation = Reservation.find(params[:reservation_id])
    @reservation_bottles = @reservation.reservation_bottles.new(reservation_bottles_params)
    @reservation_bottles.save
    redirect_to user_dashboard_path
  end

  private

  def reservation_bottles_params
    params.require(:reservation_bottle).permit(:bottle_lot_id)
  end

end
