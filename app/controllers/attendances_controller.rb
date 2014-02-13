class AttendancesController < ApplicationController
  def attendance
    if current_user
      current_user[:attendance] = true
      current_user.save
    else
      redirect_to root_path, notice: "You need to be signed in to that."
    end
  end
end
