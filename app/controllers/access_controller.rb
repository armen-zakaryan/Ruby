class AccessController < ApplicationController

  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

  def index
    redirect_to root_path
  end

  def login
    # login form
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = User.where(:username => params[:username]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end
    if authorized_user
      session[:user_id] = authorized_user.id
      session[:username] = authorized_user.username
      # TODO: mark user as logged in
      flash[:notice] = "You are now logged in."
      redirect_back_or_default root_url
      #redirect_back_or_default
      #redirect_to(:action => 'index')
    else
      flash[:notice] = "Invalid username/password combination."
      redirect_to(:action => 'login')
    end
  end

  def logout
    # TODO: mark user as logged out
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = "Logged out"
    redirect_to root_path
  end






  private
  def redirect_back_or_default(default = nil)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end


end