class AttendancesController < ApplicationController
  def index
    @users = User.all
    if current_user
      user = current_user
      current_user[:attendance] = true
      current_user.save
    else
      redirect_to root_path, notice: "You need to be signed in to do that."
    end
  end
  
  def new
  end
end
