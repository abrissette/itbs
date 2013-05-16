class AddTimesheetIdToWorklog < ActiveRecord::Migration
  def change
    add_column :worklogs, :timesheet_id, :integer
    add_index :worklogs, :timesheet_id
  end
end
