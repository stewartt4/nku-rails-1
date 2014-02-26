class AttendancesController < ApplicationController
  def new
    @attendance = Attendance.new
  end
  
  def create
    @attendance = current_user.attendances.build(attendance_params)
    @attendance.attended_on = Date.today
   
    if @attendance.save
      redirect_to attendances_path, notice: "Attendance successfully logged!"
    else
      render 'new'
    end
  end
  
  def edit
    @attendance = Attendance.find(params[:id])
  end
  
  def index
    #@attendances = Attendance.all
    @attendances = Attendance.search(params[:search])
  end
  
  
  private
    def attendance_params
      params.require(:attendance).permit(:seat_num)
    end
  end
