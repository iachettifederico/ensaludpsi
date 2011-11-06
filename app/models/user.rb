class User < ActiveRecord::Base
	attr_accessible :name, :email, :password, :password_confirmation
	attr_accessible :name, :email, :password, :password_confirmation, :admin, :editor, :as => :admin
	
	validates :email, :presence => true, :uniqueness => true, :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "debe ser una dirección de email válida" }
	validates :name, :presence => true
	
  has_secure_password
  validates_presence_of :password, :password_confirmation, :on => :create
end
