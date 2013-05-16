class CreateTimesheets < ActiveRecord::Migration
  def change
    create_table :timesheets do |t|
      t.date :end_date

      t.timestamps
    end
  end
end
