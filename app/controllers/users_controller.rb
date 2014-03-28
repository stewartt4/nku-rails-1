class UsersController < ApplicationController
  before_filter :authorize, :only => [ :upload_page ]

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
    count = Assignment.where("created_at >= ?", Time.now - 2.seconds).count
    redirect_to assignments_path, notice: "#{count} assignments were created!"
  end

  private

  def user_params
    params.require(:user).permit!
  end
end
