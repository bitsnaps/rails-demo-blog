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

    redirect_to posts_path
  end

  def create
    post = Post.create(post_params)
    redirect_to post_path(post.id)
  end

  def destroy
    @post.destroy
    redirect_to posts_path
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
