class CartsController < ApplicationController

	# create an empty cart for a new user
	def create
		session[:cart] = Hash.new(0)
	end

	def update
		params.each { |key, value| session[:cart][key] += value }
	end

	def show
		@cart = session[:cart]
	end

end