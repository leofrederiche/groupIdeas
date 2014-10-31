class LoginController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:login][:email])
    if user && user.authenticate(params[:login][:password])
      flash[:notice] = "Logado com sucesso !"
      session[:user_id] = user.id
      redirect_to show_user_path(user.id)
    else
      flash[:notice] = "E-mail ou senha incorretos !"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Obrigado por visitar !"

    redirect_to root_path
  end

end