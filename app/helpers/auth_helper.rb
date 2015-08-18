module AuthHelper


  def confirm_logged_in
    unless session[:user_id]
      store_location
      flash[:notice] = "Please log in."
      redirect_to(:controller => 'access', :action => 'login')
      return false # halts the before_action
    else
      return true
    end
  end

  private
  def store_location
    session[:return_to] = request.url
  end

end