class PostsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show, :tagged_with]
  before_filter :authorized_user, :only => [:edit, :update, :destroy]

  def index
    @posts = PostDecorator.decorate(Post.paginate(:page => params[:page], :order => 'created_at DESC', :per_page => 10))
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
      format.json { render :json => @posts }
      format.atom
    end
  end

  def tagged_with
    @the_tag = ActsAsTaggableOn::Tag.find_by_slug params[:id]
    @posts = PostDecorator.decorate(Post.tagged_with(@the_tag).paginate(:page => params[:page], :order => 'created_at DESC', :per_page => 10))
    respond_to do |format|
      format.html # tagged_with.html.erb
      format.xml  { render :xml => @posts  }
      format.json { render :json => @posts }
      format.atom
    end
  end

  def show
    @post = PostDecorator.decorate(Post.find_by_slug(params[:id]))
    @recent_posts = PostDecorator.decorate(Post.where("slug != ?",params[:id]).order("created_at DESC, title ASC").select("slug, title").limit(10))
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  def edit
    @post = Post.find_by_slug(params[:id])
  end

  def create
    @post = Post.new(params[:post])
    @post.user_id = current_user.id

    respond_to do |format|
      if @post.save
        format.html { redirect_to(post_path(@post), :notice => 'Post was successfully created.') }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @post = Post.find_by_slug(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to(post_path(@post), :notice => 'Post was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find_by_slug(params[:id])
    if @post.destroy
      redirect_to(posts_url, :notice => 'Post was successfully destroyed.')
    end
  end

  ######################################################################
  private
  ######################################################################

  def authorized_user
    post = Post.find_by_slug(params[:id])
    unless post.user == current_user || admin?
      flash[:error] = 'You must be the creator or an admin to do that'
      redirect_to root_path
    end
  end

  def set_tab
    @tab = :blog
  end
end
