class Category < ActiveRecord::Base
	has_many :categorizations
	has_many :articles, :through => :categorizations

	attr_accessible :name
	attr_accessible :name, :article_ids, :as => :admin
	attr_accessible :name, :article_ids, :as => :editor
	
	validates :name, :presence => true, :uniqueness => true, :on => :create
	
	def has_published_articles?
		self.articles.find_by_published(true)
	end
	
	def published_articles
		self.articles.find_by_published(true).to_a
	end
	
	def pending_articles
		self.articles.find_by_published(false).to_a
	end
end
