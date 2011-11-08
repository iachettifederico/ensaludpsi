class Article < ActiveRecord::Base
	has_many :categorizations
	has_many :categories, :through => :categorizations
	
	has_many :authorships
	has_many :users, :through => :authorships, :as => :authors
	
	attr_accessible :title, :contents
	attr_accessible :title, :contents, :user_ids, :category_ids, :as => :editor
	attr_accessible :title, :contents, :user_ids, :category_ids, :published, :as => :admin
	
	validates :title, :presence => true
	validates :contents, :presence => true
	
end
