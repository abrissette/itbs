class AddProjectCodeAndDescriptionColumns < ActiveRecord::Migration
  def change
    add_column :projects, :code, :string
    add_column :projects, :name, :string
  end
end
