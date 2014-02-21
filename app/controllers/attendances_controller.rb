class AttendancesController < ApplicationController
  def new
    @attendance = Attendance.new
  end
  
  def create
    @attendance = Attendance.new(params[:attendance].permit(:seat_num, :attended_on))
    @attendance.id = current_user.id
    if @attendance.save
      redirect_to attendances_path, notice: "Attendance successfully logged!"
    else
      render 'new'
    end
  end
  
  def update
    @attendance = Attendance.find(params[:id])
    @attendance[:attendance] = true
    @attendance[:attended_on] = Time.now
    
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
