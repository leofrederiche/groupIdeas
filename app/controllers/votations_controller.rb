class VotationsController < ApplicationController

  def create_like
    if current_user
      @idea = Idea.find params[:id]
      @votations_idea = @idea.votations

      @votations_idea.each do |votations|
        if votations.id_user == current_user.id
          @status = votations
        end
      end

      if @status
        @status.votation = true
        @status.save
        flash[:notice] = "Thanks for your votation !"

        redirect_to show_idea_path(@idea.id)
      else
        @status = Votation.create
        @status.votation = true
        @status.id_user = current_user.id
        @status.id_idea = @idea.id
        @status.save
        flash[:notice] = "Thanks for your votation !"

        redirect_to show_idea_path(@idea.id)
      end
    else
      redirect_to new_login_path
    end
  end

  def create_nlike
    if current_user
      @idea = Idea.find params[:id]
      @votations_idea = @idea.votations

      @votations_idea.each do |votations|
        if votations.id_user == current_user.id
          @status = votations
        end
      end

      if @status
        @status.votation = false
        @status.save
        flash[:notice] = "Thanks for your votation !"

        redirect_to show_idea_path(@idea.id)
      else
        @status = Votation.new
        @status.votation = false
        @status.id_user = current_user.id
        @status.id_idea = @idea.id
        @status.save
        flash[:notice] = "Thanks for your votation !"

        redirect_to show_idea_path(@idea.id)
      end
    else
      redirect_to new_login_path
    end
  end

end