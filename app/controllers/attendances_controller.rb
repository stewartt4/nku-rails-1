class AttendancesController < ApplicationController
  def new
    @attendance = Attendance.new
  end
  
  def create
    @attendance = Attendance.new(params[:attendance].permit(:seat_num))
    @attendance.student_name = current_user.name
    @attendance.attended_on = Date.today
    @attendance.expire = @attendance.attended_on + 1.days
    if (@attendance.attended_on >= @attendance.expire) or (@attendance.attended_on == nil)
      @attendance.save
      redirect_to attendances_path, notice: "Attendance successfully logged!"
    else
      render 'new'
    end
  end
  
  #def update
 #   @attendance = Attendance.find(params[:id])
 #   @attendance[:attendance] = true
 #   @attendance[:attended_on] = Time.now
 #   if (@attendance.attended_on >= @attendance.expire) or (@attendance == nil)
 #     @attendance.save
 #     sign_in(@attendance)
 #     redirect_to attendances_path, notice: "Attendance Successfully logged!"
 #   else
 #     render 'edit'
 #   end
 # end
  
  def index
    @attendances = Attendance.all
  end
  
  
  private
    def post_params
      params.require(:user).permit(:seat_num, :attended_on)
    end
end
