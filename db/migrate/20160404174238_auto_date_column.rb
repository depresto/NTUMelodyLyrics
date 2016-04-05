class AutoDateColumn < ActiveRecord::Migration
  def change
  	add_column :calendars, :startdate, :string
  	add_column :calendars, :enddate, :string

  	change_column_null :calendars, :startdate, false
  	change_column_null :calendars, :enddate, false
  end
end
