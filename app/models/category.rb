class Category < ActiveRecord::Base
	has_many :categorizations
	has_many :articles, :through => :categorizations

	attr_accessible :name
	attr_accessible :name, :article_ids, :as => :admin
	attr_accessible :name, :article_ids, :as => :editor
	
	validates :name, :presence => true, :uniqueness => true, :on => :create
end
