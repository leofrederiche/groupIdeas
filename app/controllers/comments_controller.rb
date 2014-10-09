class CommentsController < ApplicationController

  def create
    if current_user
      @idea = Idea.find params[:id]
      
      @new_comment = Comment.create(
        params.require(:comment).permit(
          :comment, 
          :id_user, 
          :id_idea
          )
      )

      @new_comment.id_user = current_user.id
      @new_comment.id_idea = @idea.id

      if @new_comment.save
        flash[:notice] = "Commented !"
        redirect_to show_idea_path(@idea.id)
      else
        flash[:notice] = "Error !"
        redirect_to show_idea_path(@idea.id)
      end
    else
      redirect_to new_login_path
    end
  end

end