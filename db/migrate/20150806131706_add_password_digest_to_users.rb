class AddPasswordDigestToUsers < ActiveRecord::Migration
  def change
    remove_column "users", "digest_password"
  end
end
