class AddImageColumn < ActiveRecord::Migration
  def change
  	add_column :club_properties, :image_id, :integer

  	create_table :images do |t|
  		t.string	:name, null: false
  		t.string	:hash, null: false
  	end
  end
end
