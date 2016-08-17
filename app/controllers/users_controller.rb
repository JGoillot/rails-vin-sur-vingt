class UsersController < ApplicationController
  def dashboard
    @user = User.find(current_user.id)

    @cellars = @user.cellars.all
  end

  def show
    @user = User.find(params[:id])
    @cellars = @user.cellars.all
  end

end
