class GenerationSti < ActiveRecord::Migration
  def change
  	drop_table :borrow_rooms
  	drop_table :borrow_books
  	drop_table :borrow_keyboards
  	add_column :calendars, :type, :string
  	add_column :calendars, :borrow_p_id, :integer

  	create_table "club_properties" do |t|
  		t.integer :p_id, :null => false
  		t.string :name, :null => false
  		t.boolean :borrowable, :default => false
  	end
  end
end
