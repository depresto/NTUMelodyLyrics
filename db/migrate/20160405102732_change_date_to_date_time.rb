class ChangeDateToDateTime < ActiveRecord::Migration
  def change
  	remove_column :calendars, :startdate
  	remove_column :calendars, :enddate

  	change_column :calendars, :starttime, :datetime
  	change_column :calendars, :endtime, :datetime
  	rename_column :calendars, :starttime, :start
  	rename_column :calendars, :endtime, :end
  end
end
