class AddNotNullToPk < ActiveRecord::Migration
  def change
  	change_column :users, :s_id, :string, :null => false
  	change_column :users, :name, :string, :null => false
  	change_column :users, :password_salt, :string, :null => false
  	change_column :users, :password_hash, :string, :null => false
  end
end
