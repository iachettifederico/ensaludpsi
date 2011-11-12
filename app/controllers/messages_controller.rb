class MessagesController < ApplicationController
  # GET /messages
  # GET /messages.json
  def index
    redirect_to root_path
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    redirect_to root_path
  end

  # GET /messages/new
  # GET /messages/new.json
  def new
    redirect_to root_path
  end

  # GET /messages/1/edit
  def edit
    @message = Message.find(params[:id])
  end

  # POST /messages
  # POST /messages.json
  def create
		deny_access_unless(logged_in?)
    @message = Message.new(params[:message])
    opts = { :as => :current_user }
    
    respond_to do |format|
      if @message.save(  )
				@message.update_attributes(params[:message], opts)
        format.html { redirect_to @message.article, :notice => 'Message was successfully created.' }
        format.js 
      else
        format.html { redirect_to @message.article }
      end
    end
  end

  # PUT /messages/1
  # PUT /messages/1.json
  def update
    @message = Message.find(params[:id])
		deny_access_unless(current_user?(@message.user))
    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to @message, :notice => 'Message was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @message.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message = Message.find(params[:id])

    deny_access_unless(current_user?(@message.user) || admin?)
    
    @message.destroy

    respond_to do |format|
      format.html { redirect_to @message.article }
      format.json { head :ok }
    end
  end
  
  private
  
		def deny_access_unless(condition)
			deny_access unless condition
		end
end
