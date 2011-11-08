class User < ActiveRecord::Base
	has_many :authorships
	has_many :articles, :through => :authorships
	
	attr_accessible :name, :email, :password, :password_confirmation
	attr_accessible :name, :email, :password, :password_confirmation, :admin, :editor, :article_ids, :as => :editor
	attr_accessible :name, :email, :password, :password_confirmation, :admin, :editor, :article_ids, :as => :admin
	
	validates :email, :presence => true, :uniqueness => true, :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "debe ser una dirección de email válida" }
	validates :name, :presence => true
	
  has_secure_password
  validates_presence_of :password, :password_confirmation, :on => :create
end
