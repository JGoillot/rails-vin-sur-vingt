class CellarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if search_params[:space_available].blank?
      @cellars = Cellar.all
    else
      @cellars = Cellar.where(search_params)
    end

    @cellars_maps = Cellar.where.not(latitude: nil, longitude: nil)
    @hash = Gmaps4rails.build_markers(@cellars_maps) do |cellar, marker|
      marker.lat cellar.latitude
      marker.lng cellar.longitude
    end

  end

  def show
    @cellar = Cellar.find(params[:id])
    @cellar_coordinates = { lat: @cellar.latitude, lng: @cellar.longitude }

    @hash = Gmaps4rails.build_markers(@cellar) do |cellar, marker|
      marker.lat cellar.latitude
      marker.lng cellar.longitude
    end
    @message = Message.new
  end

  def create
    @cellar = Cellar.new(cellar_params)
    @cellar.user = current_user

    if @cellar.save
      redirect_to cellar_path(@cellar)
    else
      render :new
    end
  end

  private

  def cellar_params
    params.require(:cellar).permit(:name, :description, :address, :space_available, :price_per_month, :kind, :temperature, :open_hour, photos: [])
  end

  def search_params
    params.require(:search).permit(:space_available)
  end

  def search_params
    params.require(:search).permit(:space_available)
  end

end
