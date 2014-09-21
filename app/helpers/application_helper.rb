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
      nav = "#{link_to current_user.name, show_user_path(current_user.id)} "
      nav = nav + "#{image_tag current_user.cover.url(:medium), id: 'user_picture'} "
      nav = nav + "#{link_to 'New Idea', new_idea_path} "
      nav = nav + "#{link_to 'Account', edit_user_path} "
      nav = nav + "#{link_to 'Logout', destroy_login_path} "
      nav.html_safe
    else
      nav = ""
      nav = nav + "#{link_to 'Login', new_login_path} "
      nav = nav + "#{link_to 'Sign', new_user_path}"
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

  def show_employees
    if current_user
      
      if @employees
        @employees.each do |employees|
          if employees.id_user == current_user.id
            if employees.approved == true
              @show_employees = "#{label_tag 'Você está colaborando'}"
              @show_employees = @show_employees.html_safe
            else
              @show_employees = "#{label_tag 'Aguarde a aprovação do idealizador'}"
              @show_employees = @show_employees.html_safe
            end            
          end
        end
      else
        @show_employees = "#{link_to  'Colaborar', create_employees_path(@idea.id)}"
        @show_employees = @show_employees.html_safe    
      end

    else
      @show_employees = "#{label_tag 'Faça login'}"
      @show_employees = @show_employees.html_safe
    end

  end

  def show_approvation

    if @idea.idealizer == current_user.id
      if @approvation.approved == false
        link_to "Approved", update_employees_path(@approvation.id)
      end
    end

  end

end
