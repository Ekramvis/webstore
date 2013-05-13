class ApplicationController < ActionController::Base
  protect_from_forgery

	private

	def current_user
		if session[:user_id]
			@current_user ||= User.find(session[:user_id])
		else
			return nil
		end
	end

	def logged_in?
		!!current_user
	end

	helper_method :current_user, :logged_in?
end
