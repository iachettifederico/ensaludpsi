class ApplicationController < ActionController::Base
  protect_from_forgery
  #force_ssl
  
  helper_method :logged_in?, :admin?, :editor?, :current_user, :can_edit?, :current_user?, :deny_access, :published_articles
  
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
			redirect_to root_path
		end
		
		def published_articles(is_published)
			Article.find_all_by_published(is_published).to_a
		end
	
end
