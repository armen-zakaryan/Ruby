class ChangeHotelNameLength < ActiveRecord::Migration
  def change
    remove_column "hotels", "name"
    add_column "hotels", "name", :string
  end
end
