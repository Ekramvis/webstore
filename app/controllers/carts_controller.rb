class CartsController < ApplicationController

	# create an empty cart for a new user
	# def create
	# 	session[:cart] = {}
	# end

	def update
		params["cart"].each { |key, value| session[:cart][key] += value.to_i }
		redirect_to cart_path
	end

	def show
		@cart = session[:cart]
	end

end