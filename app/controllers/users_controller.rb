class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user].permit(:name, :nickname, :email, :image))
    if @user.save
      flash[:notice] = "User created Successfully!."
      redirect_to users_path
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
 
    if @user.update(params[:user].permit(:name, :nickname, :email, :image))
      redirect_to @user
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
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
 
    redirect_to root_path
  end
  
  private
    def post_params
      params.require(:user).permit(:name, :nickname, :email, :image)
    end
end
