class Article < ActiveRecord::Base
	
	
	attr_accessible :title, :contents
	attr_accessible :title, :contents, :as => :editor
	attr_accessible :title, :contents, :as => :admin
	
	
end
