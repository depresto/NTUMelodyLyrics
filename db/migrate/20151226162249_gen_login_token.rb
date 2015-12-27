class GenLoginToken < ActiveRecord::Migration
  def change
  	create_table :login_token do |t|
  		t.string :s_id
  		t.string :token
  	end
  end
end
