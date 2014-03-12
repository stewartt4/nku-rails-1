class AssignmentsController < ApplicationController
  def index
    q = params[:search]
    if current_user.admin?
      current_user.name = "All Student"
      if q.blank?
        @assignments = Assignment.all
      else
        @assignments = Assignment.find(:all, :conditions => ["user_id LIKE ?",q])
      end
    else
      @assignments = current_user.assignments
    end
  end
  
  def new
    if current_user.admin?
      @assignment = Assignment.new
      @assignment.student_id = current_user.id
    else
      redirect_to root_path, notice: "Unauthorized"
    end
  end
  
  def create
    @assignment = Assignment.create!(assignment_params)
    redirect_to root_path, notice: "Assignment created!"
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
