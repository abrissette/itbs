class LinkTimesheetToEmployee < ActiveRecord::Migration
  def change
    add_column :timesheets, :employee_id, :integer
    remove_column :worklogs, :employee_id

    add_index :timesheets, :employee_id
  end
end
