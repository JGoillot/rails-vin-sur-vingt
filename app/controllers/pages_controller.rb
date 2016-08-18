class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @cellars = Cellar.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@cellars) do |cellar, marker|
      marker.lat cellar.latitude
      marker.lng cellar.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end
end
