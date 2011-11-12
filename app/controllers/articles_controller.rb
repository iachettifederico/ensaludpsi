class ArticlesController < ApplicationController
  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.order("updated_at desc").find_all_by_published(true).paginate(:page => params[:page], :per_page => (10 unless params[:all_pages]))
		
		if @articles.current_page >= @articles.total_pages
			@last_page = true
		else
			@last_page = false 
		end
			
		@categories = Category.all
		
		if params[:layout] == 'none'
			render :partial => @articles, :layout => nil
		else
			respond_to do |format|
				format.html # index.html.erb
				format.json { render :json => @articles } # index.json
				format.rss
			end
		end
		
    
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])
		@categories = Category.all
		@message = Message.new
		
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
		deny_access_unless(admin? || editor?)
    @article = Article.new
		@article.published = false
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
    deny_access_unless(admin? || (editor? && @article.users.include?(current_user)))
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(params[:article])
		deny_access_unless(admin? || editor?)
		
		opts = {}
		opts[:as]=[]
		
		opts = {}
		opts = { :as => :editor } if editor?
		opts = { :as => :admin } if admin?
		
    respond_to do |format|
      if @article.save(opts)
				@article.update_attributes(params[:article], opts)
        format.html { redirect_to @article, :notice => 'Article was successfully created.' }
        format.json { render :json => @article, :status => :created, :location => @article }
      else
        format.html { render :action => "new" }
        format.json { render :json => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
    @article = Article.find(params[:id])
		deny_access_unless(can_edit?(@article))
		
		opts = {}
		opts = { :as => :editor } if can_edit?(@article)
		opts = { :as => :admin } if admin?

    respond_to do |format|
      if @article.update_attributes(params[:article], opts)
        format.html { redirect_to @article, :notice => 'Article was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    deny_access_unless(admin?)

    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :ok }
    end
  end
  
  private
  
		def deny_access_unless(condition)
			deny_access unless condition
		end
end
