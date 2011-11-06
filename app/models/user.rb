class User < ActiveRecord::Base
	attr_accessible :name, :email, :password, :password_confirmation
	attr_accessible :name, :email, :password, :password_confirmation, :admin, :editor, :as => :admin
	
  has_secure_password
  validates_presence_of :password, :on => :create
end
