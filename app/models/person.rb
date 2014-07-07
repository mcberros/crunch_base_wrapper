class Person
	attr_accessor :title, :first_name, :last_name, :crunch_url

	def initialize(crunch_hostname, person_data)
		@first_name = person_data['first_name']
		@last_name = person_data['last_name']
		@title = person_data['title']
		@crunch_url = "#{crunch_hostname}#{person_data['path']}"
	end
end