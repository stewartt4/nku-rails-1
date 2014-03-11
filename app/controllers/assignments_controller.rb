class AssignmentsController < ApplicationController
  def index
    @assignment = Assignment.all
  end
  
  def new
    if current_user.admin == true
      @assignment = Assignment.new
    else
      redirect_to root_path, notice: "Need to be admin"
    end
  end
  
  def create
    @assignment = Assignment.create!(assignment_params)
    #session[:user_id] = @user.id
    redirect_to new_assignment_path, notice: "Assignment created!"
  end

  def edit
    #@assignment = current_user
  end

  def update
    #current_user.update_attributes!(user_params)
    #redirect_to users_path, notice: "Successfully updated your profile"
  end
  
  private
  
  def assignment_params
    params.require(:assignment).permit!
  end
end
