class Categorization < ActiveRecord::Base
	belongs_to :article
	belongs_to :category
	
	attr_protected :article, :category
	
end
