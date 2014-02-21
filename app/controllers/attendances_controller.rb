class AttendancesController < ApplicationController
  def new
    @attendance = Attendance.new
  end
  
  def edit
    new
    @attendance.id = current_user.id
    @attendance = Attendance.find(params[:id])
    #if current_user != @attendance
    #  redirect_to root_path, notice: "You do not have permissions to access that page."
    #end
  end
  
  def update
    @attendance = User.find(params[:id])
    @attendance[:attendance] = true
    @attendance[:attended_on] = Time.now
    #@attendance.save
    #if @attendance.update(params[:attendance].permit(:seat_num, :attended_on))
    #  sign_in(@attendance)
    #  redirect_to attendances_path, notice: "Attendance Successfully logged!"
    #else
    #  render 'edit'
    #end
    
    if (@attendance.attended_on >= @attendance.expire) or (@attendance == nil)
      @attendance.save
      sign_in(@attendance)
      redirect_to attendances_path, notice: "Attendance Successfully logged!"
    else
      render 'edit'
    end
  end
  
  def show
    @attendance.id = current_user.id
    @attendance = User.find(params[:id])
  end
  
  def index
    @users = User.all
  end
  
  
  private
    def post_params
      params.require(:user).permit(:seat_num, :attended_on)
    end
end
