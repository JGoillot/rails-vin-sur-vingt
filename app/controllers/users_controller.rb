class UsersController < ApplicationController
  def dashboard
    @user = User.find(current_user.id)

    @cellars = @user.cellars.all
  end
end
