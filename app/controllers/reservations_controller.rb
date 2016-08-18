class ReservationsController < ApplicationController
  def new
    @cellar = Cellar.find(params[:cellar_id])
    @reservation = Reservation.new
    @user = current_user
    @bottle_lots = current_user.bottle_lots
  end

  def create
    @cellar = Cellar.find(params[:cellar_id])
    @user = current_user
    @reservation = Reservation.new(reservation_params)
    @reservation.save
    redirect_to cellar_path(@cellar)
  end

  def destroy
  end

  private

  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out)
  end

end
