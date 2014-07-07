class DashboardsController < ApplicationController
	def show
		@max_company_pages = Company.get_max_pages
		unless params[:page_companies]
			@page_companies =1
			@companies = Company.page(@page_companies)
		else
			@page_companies = params[:page_companies].to_i
			@companies = Company.page(params[:page_companies])
		end

		@max_product_pages = Product.get_max_pages
		unless params[:page_products]
			@page_products =1
			@products = Product.page(@page_products)
		else
			@page_products = params[:page_products].to_i
			@products = Product.page(params[:page_products])
		end
	end
end