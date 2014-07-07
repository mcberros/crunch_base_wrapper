class ProductsController < ApplicationController
	def show
		@product = Product.get_product(params[:product_permalink])
	end
end