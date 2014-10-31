class UserController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(users_params)

		if @user.save
			flash[:notice] = "Criado com sucesso, você ja pode fazer login !"
			redirect_to root_path
		else
			flash[:notice] = "Ops, Ouve algum erro !"
			render :new
		end
	end

	def edit		
		@user = User.find_by_id(current_user.id)
	end

	def update
		@user = User.find_by_id(current_user.id)

		@user.update_attributes(
			params.require(:user).permit(
				:name, 
				:email, 
				:password, 
				:password_confirmation, 
				:cover, 
				:web, 
				:facebook, 
				:acquiriments, 
				:description
				)
		)

		flash[:notice] = "Editado com sucesso !"

		redirect_to root_path
	end

	def show
		@user = User.find params[:id]
		@likes = @user.likes
		@ideas = @user.ideas
	end

	private

	def users_params
		params.require(:user).permit(
			:name, 
			:email, 
			:password, 
			:password_confirmation, 
			:cover, 
			:like, 
			:nlike
		)
	end

end