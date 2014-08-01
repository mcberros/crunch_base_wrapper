class Product

	PRODUCTS_PER_PAGE = 10

	attr_accessor :name, :description, :image, :crunch_url, :launch_date, :articles

	def initialize(product_data)
		@crunch_hostname = product_data['metadata']['www_path_prefix']
		@name = product_data['data']['properties']['name']
		@description = has_short_description?(product_data) ? get_short_description(product_data) : ''
		@image = has_primary_image?(product_data) ? get_image_url(product_data) : ''
		permalink = "#{product_data['data']['properties']['permalink']}"
		@crunch_url = "#{@crunch_hostname}product/#{permalink}"
		@launch_date = has_launched?(product_data) ? get_launch_date(product_data) : ''
		@articles = (has_articles_data?(product_data)) ? get_five_first_articles(product_data) : nil
	end

	def self.page(model_page)
		crunch_access = CrunchAccessService.new
		model_page = model_page.to_i

		service_page = ((PRODUCTS_PER_PAGE * (model_page - 1)) / 1000 ) + 1
		crunch_products = crunch_access.get_products(service_page)

		offset = (PRODUCTS_PER_PAGE * (model_page -1 )) % 1000
		crunch_products['data']['items'].slice(offset, PRODUCTS_PER_PAGE)
			.map do |crunch_product|
				permalink = crunch_product['path'].sub(/product\//,'')
				product = crunch_access.get_product(permalink)
				Product.new(product)
			end
	end

	def self.get_max_pages()
		crunch_access = CrunchAccessService.new
		crunch_products = crunch_access.get_products
		total_products = crunch_products['data']['paging']['total_items']
		max_pages = (total_products/PRODUCTS_PER_PAGE.to_f).ceil
	end

	def self.get_product(permalink)
		crunch_access = CrunchAccessService.new
		product = crunch_access.get_product(permalink)
		Product.new(product)
	end

	def has_image?
		!@image.empty?
	end

	def has_launch_date?
		!@launch_date.empty?
	end

	def has_articles?
		!@articles.nil?
	end

	private
		def has_short_description?(product_data)
			!product_data['data']['properties']['short_description'].nil? &&
			 !product_data['data']['properties']['short_description'].empty?
		end

		def get_short_description(product_data)
			product_data['data']['properties']['short_description']
		end

		def has_relationships?(product_data)
			!product_data['data']['relationships'].empty?
		end

		def has_primary_image?(product_data)
			has_relationships?(product_data) &&
			 !product_data['data']['relationships']['primary_image'].nil?
		end

		def get_image_url(product_data)
			image_path = "#{product_data['data']['relationships']['primary_image']['items'][0]['path']}"
			"#{product_data['metadata']['image_path_prefix']}/#{image_path}"
		end

		def has_launched?(product_data)
			!product_data['data']['properties']['launched_on'].nil? &&
			 !product_data['data']['properties']['launched_on'].empty?
		end

		def get_launch_date(product_data)
			product_data['data']['properties']['launched_on']
		end

		def has_articles_data?(product_data)
	  	has_relationships?(product_data) &&
	  	 !product_data['data']['relationships']['news'].nil? &&
	  	 !product_data['data']['relationships']['news']['paging']['total_items'].nil? &&
	  	  product_data['data']['relationships']['news']['paging']['total_items'] > 0
	  end

		def get_five_first_articles(product_data)
			articles = []
			if has_articles_data?(product_data)
				articles = product_data['data']['relationships']['news']['items'].map do |article|
					Article.new(article)
				end
			end
			articles.slice(0,5)
		end
end