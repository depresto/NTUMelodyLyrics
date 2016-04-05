class AutoIdInCalendar < ActiveRecord::Migration
  def change
  	remove_column :calendars, :c_id
  end
end
