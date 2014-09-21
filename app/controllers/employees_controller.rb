class EmployeesController < ApplicationController

  def create
    if current_user
      @idea = Idea.find params[:id]
      @new_employeer = Employees.create
      @new_employeer.id_idea = @idea.id
      @new_employeer.id_user = current_user.id
      @new_employeer.approved = false
      @new_employeer.save
      flash[:notice] = "Thanks for collaborate !"
      redirect_to show_idea_path(@idea.id)  
    else
      redirect_to new_login_path
    end
    
  end

  def update
    @collaborate = Employees.find params[:id]
    @idea = Idea.find_by_id(@collaborate.id_idea)

    @collaborate.approved = true
    @collaborate.save
    flash[:notice] = "Employeer approved !"
    redirect_to show_idea_path(@idea.id)
  end

end