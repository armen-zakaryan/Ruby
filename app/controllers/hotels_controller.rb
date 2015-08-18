class HotelsController < ApplicationController

  def index
    @hotels = Hotel.all
  end

  def edit
    @hotel = Hotel.find(params[:id])
  end



end
