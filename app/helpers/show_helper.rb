module ShowHelper

  def show_settings
    if @my_ideas
      settings = "#{link_to 'Edit', edit_idea_path(@idea.id)} "
      settings = settings + "#{link_to 'Delete', destroy_idea_path(@idea.id)} "
      settings.html_safe
    end
  end

end