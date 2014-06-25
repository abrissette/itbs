class AddIsAdminToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :is_admin, :boolean, :default => false
   end
end
