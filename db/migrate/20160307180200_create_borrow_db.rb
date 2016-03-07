class CreateBorrowDb < ActiveRecord::Migration
  def change
    create_table :borrow_rooms do |t|
  		t.integer :s_id, :null => false
  		t.string :title, :null => false
  		t.integer :starttime, :null => false
  		t.integer :endtime, :null => false
  		t.boolean :allday
  		t.string :color, :default => nil
  	end
  	create_table :borrow_books do |t|
  		t.integer :s_id, :null => false
  		t.string :title, :null => false
  		t.integer :starttime, :null => false
  		t.integer :endtime, :null => false
  		t.boolean :allday
  		t.string :color, :default => nil
  	end
  	create_table :borrow_keyboards do |t|
  		t.integer :s_id, :null => false
  		t.string :title, :null => false
  		t.integer :starttime, :null => false
  		t.integer :endtime, :null => false
  		t.boolean :allday
  		t.string :color, :default => nil
  	end
  end
end
