class BottleLotsController < ApplicationController

  def new
    @bottle_lot = BottleLot.new
  end

  def create
    @bottle_lot = BottleLot.new(bottle_lot_params)
    @bottle_lot.user = current_user

    if @bottle_lot.save
      redirect_to bottle_lot_path(@bottle_lot)
    else
      render :new
    end
  end

private

  def bottle_lot_params
    params.require(:bottle_lot).permit(:name, :description, :address, :space_available, :price_per_month, :kind, :temperature, :open_hour)
  end

size
year
color
appelation
quantity

end
