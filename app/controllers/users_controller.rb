class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.create!(user_params)
    session[:user_id] = @user.id
    redirect_to users_path, notice: "#{@user.name}, Welcome to Bueller!"
  end

  def edit
    @user = current_user
  end

  def update
    current_user.update_attributes!(user_params)
    redirect_to users_path, notice: "Successfully updated your profile"
  end

  def index
    @users = User.all
    @search = params[:search] || Date.today
  end
  
  def all
    @users = User.all
  end

  def upload
    UserUploader.new(params[:file])
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit!
  end
end
