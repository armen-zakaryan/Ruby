class Hotel < ActiveRecord::Base

  def get_by_key key
    if key
      key = "%#{key}%"
      Hotel.where('address LIKE :search OR name LIKE :search', search: key)
    else
      Hotel.find()

    end
  end

end
