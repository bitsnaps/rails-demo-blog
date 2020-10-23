class PostsController < ApplicationController

  # before_action
  # around_action (do before and after an action)
  # after_action

  # Do somehting before any action (set_post is your private method)
  # before_action :set_post

  # Do something before any action
  before_action do |controller|
    puts '****************$ I am before the action'
  end

  # Do before & after an action
  # around_action :do_around

  before_action :find_post, only: [:show, :edit, :update, :destroy]
  # You can disable CSRF protection on controller, this will bypass verification of CSRF token before an action (example)
  # skip_before_action :verify_authenticity_token #, only: [:show, :edit]

  def index
    # session[:user_id] = 4
    # flash.now will show the message one time at a page
    # flash.now[:success] = 'Hi'

    # Cookies examples
    # cookies[:username] = 'Admin'
    # cookies[:username] = {
    #   value: 'Admin',
    #   expires: 1.month.from_now
    # }

    # JSON read cookies
    # if cookies[:username]
    #   puts JSON.parse(cookies[:username]).inspect
    # end

    # JSON write cookies
    # cookies[:username] = {
    #   value: JSON.generate({ name:'Admin' }),
    #   expires: 1.month.from_now
    # }

    # Signed cookies
    # cookies.signed[:username] = 'Admin'

    # Encrypted cookies
    # cookies.encrypted[:username] = 'Admin'

    # Permanent cookies
    # cookies.permanent[:username] = 'Admin'
    # cookies.permanent.signed[:username] = 'Admin'

    # Delete Cookies
    # cookies.delete(:username)

    # @posts = Post.all
    # @posts = Post.where(online: 1).all
    # Scoped queries
    # @posts = Post.published.all
    # @posts = Post.offline.alpha.all
    # @posts = Post.offline.alpha.reorder(name: :asc).all # overwrite the implicit order by alpha
    # @posts = Post.offline.alpha.rewhere(online: 1).all # overwrite the implicit where by offline

    # @posts = Post.online(1).all # scoped query with argument
    # @posts = Post.online(0).newest.all # scoped query with argument
    # @posts = Post.all # scoped query with argument
    # @posts = Post.unscoped.order(created_at: :desc).all # ignore all scoped queries
    # @posts = Post.published.unscope(:order).all # ignore the ORDER BY clause in the published scoped query
    # @posts = Post.where(online: 1, id: 3).unscope(:where).all # ignore the WHERE clause
    # @posts = Post.where(online: 0, id: 3).unscope(where: :id).all # ignore the WHERE clause on ID field

    # Include subqueries to avoid N+1 performance problem (Lazy loading)
    # @posts = Post.includes(:category).all
    @posts = Post.includes(:category: tags).all

    # debugging:
    # puts request.format

    respond_to do |format|
      format.html #{ redirect_to(posts_path) }
      # Custom format variant (tables, mobile..)
      # format.html do |variant|
      #   variant.tablet # renders app/views/projects/show.html+tablet.erb
      #   variant.phone { extra_setup; render ... }
      #   variant.none  { special_setup } # executed only if there is no variant set
      # end
      # format.json {render json: @posts }
      # as_json() can be redifined in the model Post
      format.json {render json: @posts.as_json(only: [:name, :created_at]) }
      format.xml  { render xml: @posts.to_xml(only: [:name, :content]) }
      # Custom MimeType registration (checkout: /config/initializers/mime_types.rb)
      format.rtf  { render plain: 'RTF send' }
    end
  end

  def new
    @post = Post.new
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @post }
    end
  end

  def edit
  end

  def update
    @post.update( post_params )

    # Manually add flash message
    # session[:success] = 'Article updated!'

    # Flash messages example
    # flash[:success] = 'Article updated!'
    # flash[:danger] = 'Article cannot be updated!'

    # redirect_to posts_path, flash: {success: 'Article updated!'}
    # Custom flash flag has been added to ApplicationController

    if @post.update(post_params)
      redirect_to posts_path, success: 'Article updated!'
    else
      render 'edit'
    end
  end

  def create
    post = Post.new(post_params)
    if post.valid?
      post.save
      redirect_to post_path(post.id), success: 'A new article has been created!'
    else
      @post = post
      render 'new'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, danger: 'Article deleted!'
  end

  # private methods
  def post_params
    params.require(:post).permit(:name, :content, :slug)
  end

  def find_post
    @post = Post.find(params[:id])
  end

  # def do_around
  #   puts '*************** Around before the action ********************'
  #   yield
  #   puts '*************** Around after the action ********************'
  # end

end
