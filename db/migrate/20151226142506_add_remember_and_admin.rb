class AddRememberAndAdmin < ActiveRecord::Migration
  def change
  	add_column :users, :remerberred, :boolean
  	add_column :users, :isadmin, :boolean
  end
end
