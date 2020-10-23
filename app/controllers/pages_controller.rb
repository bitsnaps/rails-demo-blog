class PagesController < ApplicationController # extends ApplicationController will extends the template layout

  def hello
    @name = params[:name] #:name will be "nil" if not provided by client
  end

  def home
    # ContactMailer.contact(Post.first).deliver #deliver_now in rails v5
  end

end
