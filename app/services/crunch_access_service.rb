require 'net/http'
require 'json'

class CrunchAccessService

	ORGANIZATIONS_URL = "http://api.crunchbase.com/v/2/organizations"
	ORGANIZATION_URL = "http://api.crunchbase.com/v/2/organization"
	PRODUCTS_URL = "http://api.crunchbase.com/v/2/products"
	PRODUCT_URL = "http://api.crunchbase.com/v/2/product"
	USER_KEY = "e314b958fbba5e68116283cf9f8cd96e"
	ORDER = "created_at+DESC"

	def get_companies(page=1)
		uri = URI("#{ORGANIZATIONS_URL}?user_key=#{USER_KEY}&page=#{page}&order=#{ORDER}")
		JSON.parse(Net::HTTP.get(uri))
	end

	def get_company(permalink)
		uri = URI("#{ORGANIZATION_URL}/#{permalink}?user_key=#{USER_KEY}")
		JSON.parse(Net::HTTP.get(uri))
	end

	def get_products(page=1)
		uri = URI("#{PRODUCTS_URL}?user_key=#{USER_KEY}&page=#{page}&order=#{ORDER}")
		JSON.parse(Net::HTTP.get(uri))
	end

	def get_product(permalink)
		uri = URI("#{PRODUCT_URL}/#{permalink}?user_key=#{USER_KEY}")
		JSON.parse(Net::HTTP.get(uri))
	end
end