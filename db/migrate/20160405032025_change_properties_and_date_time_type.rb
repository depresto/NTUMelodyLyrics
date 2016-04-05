class ChangePropertiesAndDateTimeType < ActiveRecord::Migration
  def change
  	remove_column :calendars, :borrow_p_id

  	add_column :club_properties, :type, :string
  	add_column :club_properties, :borrow_s_id, :string
  	add_column :club_properties, :deadline, :date
  	remove_column :club_properties, :p_id

  	change_column :calendars, :starttime, :time
  	change_column :calendars, :endtime, :time
  	change_column :calendars, :startdate, :date
  	change_column :calendars, :enddate, :date
  end
end
