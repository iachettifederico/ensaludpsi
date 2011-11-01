class Question < ActiveRecord::Base
	validates :from, :presence => true
	validates :subject, :presence => true
	validates :question, :presence => true

	

end
