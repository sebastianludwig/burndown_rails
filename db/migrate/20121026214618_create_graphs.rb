class CreateGraphs < ActiveRecord::Migration
  def change
    create_table :graphs do |t|
      t.references :sprint
      t.string :label
      

      t.timestamps
    end
  end
end
