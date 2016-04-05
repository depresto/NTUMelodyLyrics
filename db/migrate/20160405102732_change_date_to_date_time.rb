class ChangeDateToDateTime < ActiveRecord::Migration
  def change
  	remove_column :calendars, :startdate
  	remove_column :calendars, :enddate

  	remove_column :calendars, :starttime
  	remove_column :calendars, :endtime
  	add_column :calendars, :start, :datetime
  	add_column :calendars, :end, :datetime
  end
end
