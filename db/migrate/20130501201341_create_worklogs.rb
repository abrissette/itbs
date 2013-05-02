class CreateWorklogs < ActiveRecord::Migration
  def change
    create_table :worklogs do |t|
      t.text :employee_name
      t.date :date
      t.text :project_code
      t.text :type_code
      t.integer :value
      t.text :description

      t.timestamps
    end
  end
end
