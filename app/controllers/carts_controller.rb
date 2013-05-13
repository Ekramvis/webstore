class CartsController < ApplicationController

	before_filter :require_login

	def update
		flash[:notice] = []
		params["cart"].each do |product_id, quant|
			session[:cart][product_id] += quant.to_i
			if quant.to_i > 0
				flash[:notice] << "You've added #{quant} #{Product.find(product_id).name}"
			end
		end
		redirect_to cart_path
	end

	def show
		@cart = session[:cart]
	end


	private

	def require_login
    unless logged_in?
			flash[:notice] = []
      flash[:notice] << "You must be logged in to access this section"
      redirect_to new_session_url
    end
	end

end