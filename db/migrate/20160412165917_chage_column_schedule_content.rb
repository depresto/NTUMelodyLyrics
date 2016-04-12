class ChageColumnScheduleContent < ActiveRecord::Migration
  def change
  	rename_column :schedule_contents, :calendar_id, :schedule_id
  end
end
