class Company

	COMPANIES_PER_PAGE = 10

	attr_accessor :name, :description, :image, :crunch_url, :founded, :people

	def initialize(company_data)
		@company_data = company_data
		@crunch_hostname = @company_data['metadata']['www_path_prefix']
		@name = @company_data['data']['properties']['name']
		@description = get_short_description
		@image = get_image_url
		@crunch_url = "#{@crunch_hostname}organization/#{@company_data['data']['properties']['permalink']}"
		@founded = get_foundation_date
		@people = get_people
	end

	def self.page(model_page)
		model_page = model_page.to_i

		service_page = ((COMPANIES_PER_PAGE * (model_page - 1)) / 1000 ) + 1
		crunch_companies = @@crunch_access.get_companies(service_page)

		offset = (COMPANIES_PER_PAGE * (model_page -1 )) % 1000
		crunch_companies['data']['items'].slice(offset, COMPANIES_PER_PAGE).map do |crunch_company|
			permalink = crunch_company['path'].sub(/organization\//,'')
			company = @@crunch_access.get_company(permalink)
			Company.new(company)
		end
	end

	def self.get_max_pages()
		crunch_companies = @@crunch_access.get_companies
		total_companies = crunch_companies['data']['paging']['total_items']
		max_pages = (total_companies/COMPANIES_PER_PAGE.to_f).ceil
	end

	def self.get_company(permalink)
		company = @@crunch_access.get_company(permalink)
		Company.new(company)
	end

	def has_image?
		!@image.empty?
	end

	def has_foundation_date?
		!@founded.empty?
	end

	def has_people?
		!@people.empty?
	end

	private

	  @@crunch_access = CrunchAccessService.new

		def get_short_description
			result = ''
			unless @company_data['data']['properties']['short_description'].nil?
				result = @company_data['data']['properties']['short_description']
			end
			result
		end

		def has_relationships?
			!@company_data['data']['relationships'].empty?
		end

		def get_image_url
			result = ''
			if has_relationships? &&
			 !@company_data['data']['relationships']['primary_image'].nil?
				result = "#{@company_data['metadata']['image_path_prefix']}/#{@company_data['data']['relationships']['primary_image']['items'][0]['path']}"
			end
			result
		end

		def get_foundation_date
			result = ''
			if !@company_data['data']['properties']['founded_on'].nil?
				result = @company_data['data']['properties']['founded_on']
			end
			result
		end

		def has_people_on_team?(team)
			has_relationships? &&
	  	 !@company_data['data']['relationships'][team].nil? &&
	  	 !@company_data['data']['relationships'][team]['paging']['total_items'].nil?
		end

		def get_people
			board = []
			team = []
			if has_people_on_team?('board_members_and_advisors') || has_people_on_team?('current_team')
				board = get_people_from_team('board_members_and_advisors')
				team = get_people_from_team('current_team')
			end
			board.concat(team)
		end

		def get_people_from_team(team)
			@company_data['data']['relationships'][team]['items'].map do |person|
				Person.new(@crunch_hostname, person)
			end
		end
end