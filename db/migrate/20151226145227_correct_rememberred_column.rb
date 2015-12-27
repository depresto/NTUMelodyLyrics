class CorrectRememberredColumn < ActiveRecord::Migration
  def change
  	rename_column :users, :remerberred, :rememberred
  end
end
