class LinkWorklogToEmployeeEntity < ActiveRecord::Migration
  def change
    add_column :worklogs, :employee_id, :integer
    add_index :worklogs, :employee_id

    remove_column :worklogs, :employee_name
  end
end
