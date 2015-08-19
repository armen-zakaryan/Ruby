class HotelsController < ApplicationController

  before_action :confirm_logged_in_as_hotel_admin, :except => [:login, :attempt_login, :index]

  def index
    @hotels = Hotel.all
  end

  def edit
    @hotel = Hotel.find(params[:id])
  end



end
