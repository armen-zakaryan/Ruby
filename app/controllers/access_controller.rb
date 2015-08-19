class AccessController < ApplicationController

  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

  def index
    redirect_to root_path
  end

  def login
    #storing location to handle request source.
    #store_location({type: 'landing_login_url'})
    #login form
  end

  def attempt_login
    if params[:username].present? && params[:password].present? && params[:role].present?
      found_user = User.where({username: params[:username], role: params[:role]}).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end
    if authorized_user
      session[:user_id] = authorized_user.id
      session[:role] = authorized_user.role
      session[:username] = authorized_user.username
      # TODO: mark user as logged in
      flash[:success] = "You are now logged in as #{session[:role]}"
      redirect_back_or_default root_url
      #redirect_back_or_default
      #redirect_to(:action => 'index')
    else
      flash[:danger] = "Invalid username/password combination."

      redirect_to(:action => 'login', role: params[:role])
    end
  end

  def logout
    # TODO: mark user as logged out
    session[:user_id] = nil
    session[:role] = nil
    session[:username] = nil
    flash[:success] = "Logged out"
    redirect_to root_path
  end






  private
  def redirect_back_or_default(default = nil)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

  private
  def redirect_to_initial_login(default = nil)
    redirect_to(session[:return_to_initial_login] || default)
    session[:return_to_initial_login] = nil
  end

end