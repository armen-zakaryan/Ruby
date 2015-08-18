class User < ActiveRecord::Base
  has_secure_password
  enum _type: [:user, :hotel_admin, :admin]
end


