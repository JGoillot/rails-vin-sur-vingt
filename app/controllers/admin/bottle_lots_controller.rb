class Admin::BottleLotsController < ApplicationController
  def index
    @bottle_lots = BottleLot.all
  end

  def new
  end

  def create
  end

  def show
  end
end
