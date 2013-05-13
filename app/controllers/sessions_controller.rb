class SessionsController < ApplicationController

	def new
		render :new
	end

	def create
		user = User.find_by_email(params[:email])

		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			session[:token] = params[:authenticity_token]
			session[:cart] = Hash.new(0)
			redirect_to products_url
		else
			render :new
		end
	end

	def destroy
		reset_session

		redirect_to products_url
	end


end