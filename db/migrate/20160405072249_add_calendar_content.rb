class AddCalendarContent < ActiveRecord::Migration
  def change
  	create_table :schedule_contents do |t|
  		t.integer 	:calendar_id,	null: false
  		t.string 	:content,		null: false
  	end

  	#change_column :club_properties, :borrow_s_id, :integer
  	remove_column :club_properties, :borrow_s_id
  	#rename_column :club_properties, :borrow_s_id, :user_id
  	add_column :club_properties, :user_id, :integer
  end
end
