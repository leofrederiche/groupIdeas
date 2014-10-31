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
      nav = nav + "<li>#{link_to 'Nova Ideia', new_idea_path}</li> "
      nav = nav + "<li>#{link_to 'Editar conta', edit_user_path}</li> "
      nav = nav + "<li>#{link_to 'Sair', destroy_login_path}</li> "
      nav.html_safe
    else
      nav = ""
      nav = nav + "<li>#{link_to 'Login', new_login_path}</li> "
      nav = nav + "<li class='active' >#{link_to 'Cadastre-se', new_user_path}</li>"
      nav.html_safe
    end
  end

  def show_settings

    if current_user && @idea.idealizer == current_user.id
      render "settings"
    end
    
  end

  def show_votations
    @like = 0
    @nlike = 0

    @votations.each do |votation|
      votation.votation == true ? @like = @like + 1 : @nlike = @nlike + 1
    end

  end

  def show_opinion
    @like = 0
    @nlike = 0

    @likes.each do |like|
      like.opinion == true ? @like = @like + 1 : @nlike = @nlike + 1
    end
  end

  def show_collaborators
    if current_user
    
      if @collaborators
        if @collaborators.find_by_id_user(current_user.id)
          
          if @collaborators.find_by_id_user(current_user.id).approved == true
            render "stop"
          else
            render "waiting"
          end

        else
          render "collaborate"
        end

      end
      
    else
      render "login"
    end 

  end

  def show_approvation
    if current_user && @idea.idealizer == current_user.id
      if @approvation.approved == false
        @collaborator = @user.name
        @collaborator = @collaborator + "#{link_to " Aprovar", update_collaborators_path(@approvation.id)}"
        @collaborator = @collaborator.html_safe
      else
        @collaborator = @user.name
      end
    end
  end

end
