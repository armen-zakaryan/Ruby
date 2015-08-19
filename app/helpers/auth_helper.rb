module AuthHelper

  #Ckeck for Hotel Admin Auth
  def confirm_logged_in_as_hotel_admin
    unless (session[:user_id] && session[:role] == "hotel_admin")
      store_location
      flash[:danger] = "Please log in as Hotel Admin."
      redirect_to(:controller => 'access', :action => 'login', :role => 'hotel_admin')
      return false # halts the before_action
    else
      return true
    end
  end

  # check for a User Auth
  def confirm_logged_in
    unless (session[:user_id] && session[:role] == "user")
      store_location
      flash[:danger] = "Please log in as a User."
      redirect_to(:controller => 'access', :action => 'login', :role => 'user')
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