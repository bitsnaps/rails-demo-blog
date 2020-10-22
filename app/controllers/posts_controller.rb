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

    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
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
    redirect_to posts_path, success: 'Article updated!'
  end

  def create
    post = Post.create(post_params)
    redirect_to post_path(post.id), success: 'A new article has been created!'
  end

  def destroy
    @post.destroy
    redirect_to posts_path, danger: 'Article deleted!'
  end

  # private methods
  def post_params
    params.require(:post).permit(:name, :content)
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
