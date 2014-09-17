class IdeasController < ApplicationController

  def index
    @ideas = Idea.all
    @my_ideas = current_user.ideas
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(ideas_params)
    @idea.like = 0
    @idea.nlike = 0
    @idea.idealizer = current_user.id
    if @idea.link == nil
      @idea.link = "#"
    end
    if @idea.github == nil
      @idea.github = "#"
    end

    if @idea.save
      redirect_to show_idea_path @idea
    else
      flash[:notice] = "There was an error, please try again later."
      render :new
    end
  end

  def edit
    @idea = Idea.find params[:id]
  end

  def update
    @idea = Idea.find params[:id]
    @idea.update_attributes(params.require(:idea).permit(:title, :idea, :link, :github))
    flash[:notice] = "Edited with Succes !"
    
    redirect_to show_idea_path(@idea.id)
  end

  def destroy
    @idea = Idea.find params[:id]
    @idea.delete
    flash[:notice] = "Excluded !"

    redirect_to ideas_path
  end

  def show
    @idea = Idea.find params[:id]
    @my_idea = current_user.ideas
    @user = User.find_by_id(@idea.idealizer)
  end

  private

  def ideas_params
    params.require(:idea).permit(:title, :idea, :idealizer, :like, :nlike, :link, :github)
  end

end