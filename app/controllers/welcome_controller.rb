class WelcomeController < ApplicationController

	def index
		@users_array = User.all.to_a
    @users = User.all
	end

end