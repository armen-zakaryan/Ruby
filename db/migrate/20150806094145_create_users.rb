class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.column "first_name", :string, :limit => 25
      t.string "last_name", :limit => 50
      t.string "email", :null => false
      t.string "username", :null => false
      t.string "password_digest"
      t.column "_type", :integer, default: 0

      t.timestamps
    end
  end
end
