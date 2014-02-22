class AttendancesController < ApplicationController
  def new
    @attendance = Attendance.new
  end
  
  def create
    @attendance = Attendance.new(params[:attendance].permit(:seat_num))
    @attendance.id = current_user.id
    @attendance.student_name = current_user.name
    @attendance.attended_on = Date.today
    @attendance.expire = @attendance.attended_on + 1.days
    current_user.attended_on = @attendance.attended_on
    current_user.save
    if @attendance.save
      redirect_to attendances_path, notice: "Attendance successfully logged!"
    else
      render 'new'
    end
  end
  
  def edit
    @attendance = Attendance.find(params[:id])
      #@attendance.student_name = current_user.name
      #@attendance.attended_on = Date.today
      #@attendance.expire = @attendance.attended_on + 1.days
      #@attendance.save
      #redirect_to attendances_path, notice: "Attendance successfully logged!"
    #else
    #  render 'edit'
    #end
  end
  
   def update
     @attendance = Attendance.find(params[:id])
    
     if @attendance.attended_on >= @attendance.expire
       @attendance.attended_on = Time.now
       @attendance.expire = @attendance.attended_on + 1.days
    
       if @attendance.update(params[:user].permit(:seat_num))
         redirect_to attendances_path, notice: "Attendance successfully changed!"
       end
    else
       redirect_to edit_attendance_path, notice: "You are already here for today!"
    end
  end
  
  def index
    @attendances = Attendance.all
  end
  
  
  private
    def post_params
      params.require(:user).permit(:seat_num, :attended_on)
    end
end
