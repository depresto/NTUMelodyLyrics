class AddCalendarContentId < ActiveRecord::Migration
  def change
  	add_column :calendars, :schedule_content_id, :integer
  end
end
