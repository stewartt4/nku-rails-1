class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user].permit(:name, :nickname, :email, :image))
    if @user.save
      redirect_to users_path, notice: "User successfully created!"
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
  
  # Used for testing
  
  #def destroy
  #  @user = User.find(params[:id])
  #  @user.destroy
 
  #  redirect_to root_path
  #end
    
  def upload
    uploaded_io = params[:name][:image]
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
  end
  
  private
    def post_params
      params.require(:user).permit(:name, :nickname, :email, :image)
    end
end
