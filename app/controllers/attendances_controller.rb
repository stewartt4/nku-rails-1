class AttendancesController < ApplicationController
  def new
    @user = User.new
  end
  
  def edit
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to root_path, notice: "You do not have permissions to access that page."
    end
    #update
  end
  
  def update
    @user = User.find(params[:id])
    current_user[:attendance] = true
    current_user[:attended_on] = Time.now
    current_user.save
    if @user.update(params[:user].permit(:seat_num, :attended_on))
      sign_in(@user)
      redirect_to attendances_path, notice: "Attendance Successfully logged!"
    else
      render 'edit'
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def index
    @users = User.all
  end
  
  private
    def post_params
      params.require(:user).permit(:seat_num, :attended_on)
    end
end
