class CorrectRemeberredCol < ActiveRecord::Migration
  def change
  	remove_column :users, :rememberred
  	rename_column :users, :remerberred, :rememberred
  end
end
