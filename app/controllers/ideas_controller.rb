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

    if @idea.save
      redirect_to show_idea_path @idea
    else
      flash[:notice] = "There was an error, please try again later."
      render :new
    end
  end

  def show
    @idea = Idea.find params[:id]
    @user = User.find_by_id(@idea.idealizer)
    @new_comment = Comment.new
    @comments = @idea.idea_comments
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

  def new_comment
    @idea = Idea.find params[:id]
    @new_comment = Comment.create(params.require(:comment).permit(:comment, :id_user, :id_idea))
    @new_comment.id_user = current_user.id
    @new_comment.id_idea = @idea.id

    if @new_comment.save
      flash[:notice] = "Commented !"
      redirect_to show_idea_path(@idea.id)
    else
      flash[:notice] = "Error !"
      redirect_to show_idea_path(@idea.id)
    end
  end

  private

  def ideas_params
    params.require(:idea).permit(:title, :idea, :idealizer, :like, :nlike, :link, :github)
  end

end