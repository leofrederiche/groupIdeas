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
      nav = "#{label_tag current_user.name} "
      nav = nav + "#{image_tag current_user.cover.url(:medium), id: 'user_picture'} "
      nav = nav + "#{link_to 'New Idea', new_idea_path} "
      nav = nav + "#{link_to 'Editar', edit_user_path} "
      nav = nav + "#{link_to 'Logout', destroy_login_path} "
      nav.html_safe
    else
      nav = ""
      nav = nav + "#{link_to 'Login', new_login_path} "
      nav = nav + "#{link_to 'Sign', new_user_path}"
      nav.html_safe
    end
  end

end
