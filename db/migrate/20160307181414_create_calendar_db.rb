class CreateCalendarDb < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
  		t.integer :s_id, :null => false
  		t.string :title, :null => false
  		t.integer :starttime, :null => false
  		t.integer :endtime, :null => false
  		t.boolean :allday
  		t.string :color, :default => nil
  	end
  end
end
