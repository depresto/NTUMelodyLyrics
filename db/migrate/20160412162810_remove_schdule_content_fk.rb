class RemoveSchduleContentFk < ActiveRecord::Migration
  def change
  	remove_column :schedule_contents, :calendar_id
  end
end
