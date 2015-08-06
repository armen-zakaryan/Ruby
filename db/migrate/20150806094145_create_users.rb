class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.column "first_name", :string, :limit => 25
      t.string "last_name", :limit => 50
      t.string "email", :null => false
      t.string "password", :limit => 40

      t.timestamps
    end
  end
end
