class RemoveProjectCodeFromWorklog < ActiveRecord::Migration
  def up
    remove_column :worklogs, :project_code
  end

  def down
    add_column :worklogs, :project_code, :text
  end
end
