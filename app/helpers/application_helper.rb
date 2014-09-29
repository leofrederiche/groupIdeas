module ApplicationHelper

  def show_errors(model)
    if model.errors.any? 
      model.errors.full_messages
    else
      []
    end
  end

  def nav
    if current_user
      nav = "<li>#{link_to current_user.name, show_user_path(current_user.id)}</li> "
      nav = nav + "<li>#{image_tag current_user.cover.url(:medium), id: 'user_picture'}</li> "
      nav = nav + "<li>#{link_to 'New Idea', new_idea_path}</li> "
      nav = nav + "<li>#{link_to 'Account', edit_user_path}</li> "
      nav = nav + "<li>#{link_to 'Logout', destroy_login_path}</li> "
      nav.html_safe
    else
      nav = ""
      nav = nav + "<li>#{link_to 'Login', new_login_path}</li> "
      nav = nav + "<li class='active' >#{link_to 'Sign up', new_user_path}</li>"
      nav.html_safe
    end
  end

  def show_settings
    if current_user

      @my_ideas.each do |ideas|
        if ideas.idealizer == current_user.id
          @settings = "#{link_to 'Edit', edit_idea_path(@idea.id)} "
          @settings = @settings + "#{link_to 'Delete', destroy_idea_path(@idea.id)} "
          @settings = @settings.html_safe
        end
      end
      
    end    
  end

  def show_votations
    @like = 0
    @nlike = 0

    @votations.each do |votation|
      if votation.votation == true
        @like = @like + 1
      else
        @nlike = @nlike + 1
      end
    end

  end

  def show_collaborators
    if current_user
    
      if @collaborators
        if @collaborators.find_by_id_user(current_user.id)
          
          if @collaborators.find_by_id_user(current_user.id).approved == true
            @show_collaborators = "#{label_tag 'You are on team !'}"
            @show_collaborators = @show_collaborators + "#{link_to 'Stop collaborate', destroy_collaborators_path(@collaborators.find_by_id_user(current_user.id).id)}"
            @show_collaborators = @show_collaborators.html_safe
          else
            @show_collaborators = "#{label_tag 'Wait approbation of idealizer'}"
            @show_collaborators = @show_collaborators.html_safe
          end

        else
          @show_collaborators = "#{link_to  'Collaborate', create_collaborators_path(@idea.id)}"
          @show_collaborators = @show_collaborators.html_safe
        end

      end
      
    else
      @show_collaborators = "#{label_tag 'You most be logged in for collaborate'}"
      @show_collaborators = @show_collaborators.html_safe
    end 

  end

  def show_approvation

    if @idea.idealizer == current_user.id
      if @approvation.approved == false
        @collaborator = @user.name
        @collaborator = @collaborator + "#{link_to "Approved", update_collaborators_path(@approvation.id)}"
        @collaborator = @collaborator.html_safe
      else
        @collaborator = @user.name
      end
    end

  end

end
