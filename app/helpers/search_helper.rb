module SearchHelper

  def search_all(key)
    @hotels = [].push Hotel.find(key)
  end

  def get_by_key key
    @hotels = get_by_key key
  end



end