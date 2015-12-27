class ChangeBooleanDefault < ActiveRecord::Migration
  def change
  	change_column_default :users, :rememberred, 0
  	change_column_default :users, :isadmin, 0
  end
end
