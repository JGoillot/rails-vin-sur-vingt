class CellarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    # if params with search
      # @cellars = Cellar.where with critaeria
    # else
      # @cellars = Cellar.all
    # end
  end

  def show
  end

end
