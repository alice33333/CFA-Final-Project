class SessionsController < ApplicationController

  def new
    @user = User.new(:name => "Lynnae Schneller", :email => "lynnae@example.com", :password => "foobar", :password_confirmation => "foobar", :role => 0, :username => "lynnae",
    :admin => true)
    @user.save
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
      if user && user.authenticate(params[:session][:password])
        log_in user
        remember user
        redirect_back_or user
      else
        flash.now[:danger] = 'Invalid username/password combination'
        render 'new'
      end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end