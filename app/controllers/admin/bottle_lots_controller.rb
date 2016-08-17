class Admin::BottleLotsController < ApplicationController
  def index
    @bottle_lots = @user.bottle_lots
  end

  def new
    @bottle_lot = BottleLot.new
  end

  def create
  end

  def show
  end
end
