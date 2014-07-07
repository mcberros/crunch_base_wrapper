class CompaniesController < ApplicationController
	def show
		@company = Company.get_company(params[:company_permalink])
	end
end