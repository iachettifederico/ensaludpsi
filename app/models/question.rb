class Question < ActiveRecord::Base
	validates :from, :presence => true, :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "debe ser una dirección de email válida" }
	validates :subject, :presence => true
	validates :question, :presence => true

	

end
