class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end
