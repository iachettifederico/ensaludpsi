class ApplicationController < ActionController::Base
  protect_from_forgery
  #force_ssl
  
  helper_method :logged_in?, :admin?, :editor?,
								:current_user, :current_user?, 
								:can_edit?, :deny_access,
								:published_articles, :last_articles
  
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
		
		def can_edit?(article)
			admin? || (article.users.include?(current_user) && editor? )
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
		
		def last_articles(quantity = 10)
			Article.order("updated_at desc").limit(quantity).find_all_by_published(true).paginate(:page => 1, :per_page => quantity)
		end
	
end
