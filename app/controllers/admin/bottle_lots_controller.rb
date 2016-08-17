class Admin::BottleLotsController < ApplicationController
  def index
    @user = current_user
    @bottle_lots = @user.bottle_lots
  end

  def new
    @bottle_lot = BottleLot.new
  end

  def create
    @bottle_lot = BottleLot.new(bottle_lot_params)
    @bottle_lot.user = current_user

    if @bottle_lot.save
      redirect_to admin_bottle_lots_path(@bottle_lot)
    else
      render :new
    end
  end

  private

  def bottle_lot_params
    params.require(:bottle_lot).permit(:size, :year, :color, :appelation, :quantity)
  end
end
