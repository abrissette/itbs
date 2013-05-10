class RemoveTypeCodeFromWorklog < ActiveRecord::Migration
  def change
    remove_column :worklogs, :type_code
  end
end
