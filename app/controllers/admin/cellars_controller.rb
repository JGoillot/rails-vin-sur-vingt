class Admin::CellarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
  end

  def new
    @cellar = Cellar.new
  end

  def edit
  end

end
