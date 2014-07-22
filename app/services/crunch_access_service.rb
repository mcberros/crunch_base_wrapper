require 'net/http'
require 'json'

class CrunchAccessService

	def get_companies(page=1)
		uri = URI("#{CRUNCH_BASE_CONFIG['organizations_url']}?user_key=#{CRUNCH_BASE_CONFIG['user_key']}&page=#{page}&order=#{CRUNCH_BASE_CONFIG['order']}")
		JSON.parse(Net::HTTP.get(uri))
	end

	def get_company(permalink)
		uri = URI("#{CRUNCH_BASE_CONFIG['organization_url']}/#{permalink}?user_key=#{CRUNCH_BASE_CONFIG['user_key']}")
		JSON.parse(Net::HTTP.get(uri))
	end

	def get_products(page=1)
		uri = URI("#{CRUNCH_BASE_CONFIG['products_url']}?user_key=#{CRUNCH_BASE_CONFIG['user_key']}&page=#{page}&order=#{CRUNCH_BASE_CONFIG['order']}")
		JSON.parse(Net::HTTP.get(uri))
	end

	def get_product(permalink)
		uri = URI("#{CRUNCH_BASE_CONFIG['product_url']}/#{permalink}?user_key=#{CRUNCH_BASE_CONFIG['user_key']}")
		JSON.parse(Net::HTTP.get(uri))
	end
end
