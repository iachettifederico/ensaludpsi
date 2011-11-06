class ApplicationController < ActionController::Base
  protect_from_forgery
  #force_ssl
  
  helper_method :logged_in?, :admin?, :editor?, :current_user, :can_edit?, :current_user?, :deny_access
  
  private
  
    def logged_in?
      current_user
    end
    
    def admin?
      current_user.admin? if current_user
    end
    
		def editor?
			current_user.editor? if current_user
		end
		
		def current_user
			@current_user ||= User.find(session[:user_id]) if session[:user_id]
		end
		
		def can_edit?
			
		end
    
    def current_user?(user)
			user == current_user
		end

		def deny_access
			redirect_to signin_path, :notice => "Por favor inicie sesión para poder proceder."
		end
end
