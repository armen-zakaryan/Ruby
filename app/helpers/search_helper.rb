module SearchHelper
  private
  def search_by key
    @hotels = Hotel.where(name: key)
  end

end