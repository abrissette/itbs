class AddNewTypeToWorklog < ActiveRecord::Migration
  def change
    add_column :worklogs, :type_id, :integer
    add_index :worklogs, :type_id
  end
end
