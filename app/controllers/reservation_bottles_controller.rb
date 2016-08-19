class ReservationBottlesController < ApplicationController

  def create
    @bottle_lots = BottleLot.find(reservation_bottles_params[:bottle_lot_id])
    @reservation = Reservation.find(params[:reservation_id])
    @cellar = Cellar.find(@reservation.cellar_id)
    @reservation_bottles = @reservation.reservation_bottles.new(reservation_bottles_params)
    @reservation_bottles.save
    @cellar.space_available = (@cellar.space_available - @bottle_lots.quantity)
    @cellar.save
    redirect_to user_dashboard_path
  end

  private

  def reservation_bottles_params
    params.require(:reservation_bottle).permit(:bottle_lot_id)
  end

end
