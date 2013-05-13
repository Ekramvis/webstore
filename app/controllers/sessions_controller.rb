class SessionsController < ApplicationController

	def new
		render :new
	end

	def create
		user = User.find_by_email(params[:email])

		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			session[:token] = params[:authenticity_token]
			# redirect_to user_path(user.id)
		else
			render :new
		end
	end



end