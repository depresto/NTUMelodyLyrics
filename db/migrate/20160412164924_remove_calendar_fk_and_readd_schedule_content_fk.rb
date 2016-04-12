class RemoveCalendarFkAndReaddScheduleContentFk < ActiveRecord::Migration
  def change
  	add_column :schedule_contents, :calendar_id, :integer
  	remove_column :calendars, :schedule_content_id
  end
end
