class MoveProjectAsExternalTable < ActiveRecord::Migration
  def up
    add_column :worklogs, :project_id, :integer
    add_index :worklogs, :project_id
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "cannot undo this migration"
  end
end
