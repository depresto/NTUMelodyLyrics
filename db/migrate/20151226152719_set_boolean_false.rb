class SetBooleanFalse < ActiveRecord::Migration
  def change
    remove_column :users, :remerberred
		add_column :users, :remerberred, :boolean, :null => false, :default => false
    remove_column :users, :isadmin
		add_column :users, :isadmin, :boolean, :null => false, :default => false
  end
end
