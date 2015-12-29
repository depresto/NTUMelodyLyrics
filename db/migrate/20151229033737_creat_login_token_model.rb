class CreatLoginTokenModel < ActiveRecord::Migration
  def change
  	rename_table :login_token, :login_tokens
  end
end
