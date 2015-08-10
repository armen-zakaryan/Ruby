class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.column "name", :string, :null => false
      t.string "phone", :limit => 50
      t.string "email"
      t.string "address"
      t.string "guests"
      t.string "customers"
      t.string "branches"

      t.timestamps
    end
  end
end
