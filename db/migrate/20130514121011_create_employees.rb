class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :jira_username
      t.string :tempo_staff_id
      t.string :employee_number

      t.timestamps
    end
  end
end
