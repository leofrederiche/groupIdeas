class LoginController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:login][:email])
    if user && user.authenticate(params[:login][:password])
      flash[:notice] = "Logged with success !"
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:notice] = "Incorrect e-mail or password !"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Thanks for coming !"

    redirect_to root_path
  end

end