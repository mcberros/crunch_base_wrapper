class Company

	COMPANIES_PER_PAGE = 10

	attr_accessor :name, :description, :image, :crunch_url, :founded, :people

	def initialize(company_data)
		@crunch_hostname = company_data['metadata']['www_path_prefix']
		@name = company_data['data']['properties']['name']
		@description = has_short_description?(company_data) ? get_short_description(company_data) : ''
		@image = has_primary_image?(company_data) ? get_image_url(company_data) : ''
		@crunch_url = "#{@crunch_hostname}organization/#{company_data['data']['properties']['permalink']}"
		@founded = has_founded?(company_data) ? get_foundation_date(company_data) : ''
		@people = (has_board?(company_data) || has_current_team?(company_data)) ? get_people(company_data) : nil
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

	def self.get_company(permalink)
		crunch_access = CrunchAccessService.new
		company = crunch_access.get_company(permalink)
		Company.new(company)
	end

	def has_image?
		!@image.empty?
	end

	def has_foundation_date?
		!@founded.empty?
	end

	def has_people?
		!@people.nil?
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

		def has_board?(company_data)
	  	has_relationships?(company_data) &&
	  	 !company_data['data']['relationships']['board_members_and_advisors'].nil? &&
	  	 !company_data['data']['relationships']['board_members_and_advisors']['paging']['total_items'].nil? &&
	  	  company_data['data']['relationships']['board_members_and_advisors']['paging']['total_items'] > 0
	  end

		def has_current_team?(company_data)
	  	has_relationships?(company_data) &&
	  	 !company_data['data']['relationships']['current_team'].nil? &&
	  	 !company_data['data']['relationships']['current_team']['paging']['total_items'].nil? &&
	  	  company_data['data']['relationships']['current_team']['paging']['total_items'] > 0
	  end

		def get_people(company_data)
			board = []
			team = []
			if has_board?(company_data)
				board = company_data['data']['relationships']['board_members_and_advisors']['items'].map do |board_member|
					Person.new(@crunch_hostname, board_member)
				end
			end
			if has_current_team?(company_data)
				team = company_data['data']['relationships']['current_team']['items'].map do |team_member|
					Person.new(@crunch_hostname, team_member)
				end
			end
			board.concat(team)
		end

		def has_primary_image?(company_data)
			has_relationships?(company_data) &&
			 !company_data['data']['relationships']['primary_image'].nil?
		end

		def get_image_url(company_data)
			"#{company_data['metadata']['image_path_prefix']}/#{company_data['data']['relationships']['primary_image']['items'][0]['path']}"
		end

		def has_founded?(company_data)
			!company_data['data']['properties']['founded_on'].nil? &&
			 !company_data['data']['properties']['founded_on'].empty?
		end

		def get_foundation_date(company_data)
			company_data['data']['properties']['founded_on']
		end
end