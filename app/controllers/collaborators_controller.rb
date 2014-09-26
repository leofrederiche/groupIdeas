class CollaboratorsController < ApplicationController

  def create
    if current_user
      @idea = Idea.find params[:id]
      @new_collaborator = Collaborator.create
      @new_collaborator.id_idea = @idea.id
      @new_collaborator.id_user = current_user.id
      @new_collaborator.approved = false
      @new_collaborator.save
      flash[:notice] = "Thanks for collaborate !"
      redirect_to show_idea_path(@idea.id)  
    else
      redirect_to new_login_path
    end
    
  end

  def update
    @collaborate = Collaborator.find params[:id]
    @idea = Idea.find_by_id(@collaborate.id_idea)

    @collaborate.approved = true
    @collaborate.save
    flash[:notice] = "Collaboration approved !"
    redirect_to show_idea_path(@idea.id)
  end

  def destroy
    @collaborate = Collaborator.find params[:id]
    @idea = Idea.find_by_id(@collaborate.id_idea)

    @collaborate.delete
    flash[:notice] = "Collaboration canceled"
    redirect_to show_idea_path(@idea.id)
  end

  def show
    @collaborations = current_user.collaborations
  end

end