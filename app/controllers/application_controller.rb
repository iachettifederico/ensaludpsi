class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :logged_in?, :admin?
  
  protected
  
    def logged_in?
      false
    end
    
    def admin?
      false
    end
    
    
end
