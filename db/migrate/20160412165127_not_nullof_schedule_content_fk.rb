class NotNullofScheduleContentFk < ActiveRecord::Migration
  def change
  	change_column :schedule_contents, :calendar_id, :integer, null: false
  end
end
