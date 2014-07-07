class Company

	COMPANIES_PER_PAGE = 10

	attr_accessor :name, :description, :image

	def initialize(company_data)
		@name = company_data['data']['properties']['name']
		@description = has_short_description?(company_data) ? get_short_description(company_data) : ''
		@image = has_primary_image?(company_data) ? get_image_url(company_data) : ''
	end

	def self.page(model_page)
		crunch_access = CrunchAccessService.new
		model_page = model_page.to_i

		service_page = ((COMPANIES_PER_PAGE * (model_page - 1)) / 1000 ) + 1
		crunch_companies = crunch_access.get_companies(service_page)

		offset = (COMPANIES_PER_PAGE * (model_page -1 )) % 1000
		crunch_companies['data']['items'].slice(offset, COMPANIES_PER_PAGE).map do |crunch_company|
			permalink = crunch_company['path'].sub(/organization\//,'')
			company = crunch_access.get_company(permalink)
			Company.new(company)
		end
	end

	def self.get_max_pages()
		crunch_access = CrunchAccessService.new
		crunch_companies = crunch_access.get_companies
		total_companies = crunch_companies['data']['paging']['total_items']
		max_pages = (total_companies/COMPANIES_PER_PAGE.to_f).ceil
	end

	def has_image?
		!@image.empty?
	end

	private
		def has_short_description?(company_data)
			!company_data['data']['properties']['short_description'].nil? &&
			 !company_data['data']['properties']['short_description'].empty?
		end

		def get_short_description(company_data)
			company_data['data']['properties']['short_description']
		end

		def has_relationships?(company_data)
			!company_data['data']['relationships'].empty?
		end

		def has_primary_image?(company_data)
			has_relationships?(company_data) &&
			 !company_data['data']['relationships']['primary_image'].nil?
		end

		def get_image_url(company_data)
			"#{company_data['metadata']['image_path_prefix']}/#{company_data['data']['relationships']['primary_image']['items'][0]['path']}"
		end
end