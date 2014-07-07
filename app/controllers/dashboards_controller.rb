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
	end
end