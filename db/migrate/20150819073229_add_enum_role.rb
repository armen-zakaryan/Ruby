class AddEnumRole < ActiveRecord::Migration
  def up
    add_column "users", :role, "ENUM('user', 'hotel_admin', 'admin')"
  end

  def down
    remove_column "users", :role, "ENUM('user', 'hotel_admin', 'admin')"
  end
end
