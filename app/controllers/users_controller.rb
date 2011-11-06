class UsersController < ApplicationController
	before_filter :authenticate, :only => [:edit, :update]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :authenticate_admin, :only => [:toggle_admin, :toggle_editor]
  
	def index
		@users = User.all
	end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end
  
	def show
		@user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user }
    end
	end
	
	def edit
		@user = User.find(params[:id])
		respond_to do |format|
			format.html # show.html.erb
			format.json { render :json => @user }
    end
	end
	
	def update
    @user = User.find(params[:id])
		opts = current_user.admin? ? {:as => :admin} : {}
		
		respond_to do |format|
			if @user.update_attributes(params[:user], opts)
				format.html { redirect_to @user, :notice => 'User was successfully updated.' }
				format.json { head :ok }
			else
				format.html { render :action => "edit" }
				format.json { render :json => @user.errors, :status => :unprocessable_entity }
			end
		end
  end
  
  def toggle_admin
    @user = User.find(params[:id])
		if current_user.admin?
			@user.admin = !@user.admin?
			@user.save
			redirect_to users_path
		end
  end
  
  def toggle_editor
    @user = User.find(params[:id])
		if current_user.admin?
			@user.editor = !@user.editor?
			@user.save
			redirect_to users_path
		end
  end
  
private
	def authenticate
		deny_access unless logged_in?
	end

	def correct_user
		@user = User.find(params[:id])
		redirect_to(root_path) unless current_user?(@user)
	end
	
	def authenticate_admin
		deny_access unless admin?
	end
  
end
