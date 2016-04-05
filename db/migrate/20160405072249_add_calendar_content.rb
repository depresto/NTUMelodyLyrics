class AddCalendarContent < ActiveRecord::Migration
  def change
  	create_table :schedule_contents do |t|
  		t.integer 	:calendar_id,	null: false
  		t.string 	:content,		null: false
  	end

  	change_column :club_properties, :borrow_s_id, :integer
  	rename_column :club_properties, :borrow_s_id, :user_id
  end
end
