class LikesController < ApplicationController

  def create_like
    if current_user
      @user = User.find params[:id]
      @like_by = @user.likes

      @like_by.each do |like|
        if like.id_from == current_user.id
          @status = like
        end
      end

      if @status
        @status.opinion = true
        @status.save
        flash[:notice] = "Thanks for your votation !"

        redirect_to show_user_path(@user.id)
      else
        @status = Like.create
        @status.opinion = true
        @status.id_from = current_user.id
        @status.id_by = @user.id
        @status.save
        flash[:notice] = "Thanks for your votation !"

        redirect_to show_user_path(@user.id)
      end
    else
      redirect_to new_login_path
    end
  end

  def create_nlike
    if current_user
      @user = User.find params[:id]
      @like_by = @user.likes

      @like_by.each do |like|
        if like.id_from == current_user.id
          @status = like
        end
      end

      if @status
        @status.opinion = false
        @status.save
        flash[:notice] = "Thanks for your votation !"

        redirect_to show_user_path(@user.id)
      else
        @status = Like.create
        @status.opinion = false
        @status.id_from = current_user.id
        @status.id_by = @user.id
        @status.save
        flash[:notice] = "Thanks for your votation !"

        redirect_to show_user_path(@user.id)
      end
    else
      redirect_to new_login_path
    end
  end

end