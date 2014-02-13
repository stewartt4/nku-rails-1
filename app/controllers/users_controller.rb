class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def attendance
    @users = User.all
    if current_user
      current_user[:attendance] = true
      current_user.save
    else
      redirect_to root_path, notice: "You need to be signed in to do that."
    end
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
 
    if @user.update(params[:user].permit(:name, :nickname, :email, :image))
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
  
  private
    def post_params
      params.require(:user).permit(:name, :nickname, :email, :image)
    end
end
