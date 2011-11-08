class Authorship < ActiveRecord::Base
	belongs_to :article
	belongs_to :user
	
	attr_protected :article, :user
end
