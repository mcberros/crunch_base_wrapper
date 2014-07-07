require 'net/http'
require 'json'

class CrunchAccessService

	ORGANIZATIONS_URL= "http://api.crunchbase.com/v/2/organizations"
	ORGANIZATION_URL= "http://api.crunchbase.com/v/2/organization"

	def get_companies(page=1)
		uri = URI("#{ORGANIZATIONS_URL}?user_key=e314b958fbba5e68116283cf9f8cd96e&page=#{page}&order=created_at+DESC")
		JSON.parse(Net::HTTP.get(uri))
	end

	def get_company(permalink)
		uri = URI("#{ORGANIZATION_URL}/#{permalink}?user_key=e314b958fbba5e68116283cf9f8cd96e")
		JSON.parse(Net::HTTP.get(uri))
	end
end