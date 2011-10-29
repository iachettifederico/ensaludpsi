class ApplicationController < ActionController::Base
  protect_from_forgery
  force_ssl
  
  helper_method :logged_in?, :admin?, :editor?, :current_user
  
  private
  
    def logged_in?
      false
    end
    
    def admin?
      false
    end
    
		def editor?
			false
		end
		
		def current_user
			@current_user ||= User.find(session[:user_id]) if session[:user_id]
		end
    
    
end
