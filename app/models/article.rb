class Article
	attr_accessor :author, :posted_on, :title, :article_url

	def initialize(article_data)
		@author = article_data['author']
		@posted_on = article_data['posted_on']
		@title = article_data['title']
		@article_url = article_data['url']
	end
end