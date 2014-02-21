class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user].permit(:name, :nickname, :email, :image, :password, :password_confirmation))
    if @user.save
      redirect_to users_path, notice: "User successfully created!"
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to root_path, notice: "You do not have permissions to access that page."
    end
  end
  
  def update
    @user = User.find(params[:id])
    current_user[:attendance] = true
    current_user[:attended_on] = Time.now
    current_user.save
    if @user.update(params[:user].permit(:name, :nickname, :email, :image, :seat_num, :attended_on))
      sign_in(@user)
      redirect_to root_path, notice: "User successfully changed!"
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
  
  def self.in_seat(seat, date)
    User.joins(:attendances).where(attendances: {seat_num: seat, attended_on: date})
  end

  def self.absent(date)
    User.joins(:attendances).where.not(attendances: {attended_on: date})
  end
  
  private
    def post_params
      params.require(:user).permit(:name, :nickname, :email, :image)
    end
end
