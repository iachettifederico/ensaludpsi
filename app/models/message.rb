class Message < ActiveRecord::Base
	belongs_to :user
	belongs_to :article
	
	attr_accessible :user_id, :article_id, :message, :as => :current_user
end
