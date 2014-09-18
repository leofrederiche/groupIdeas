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

  

end
