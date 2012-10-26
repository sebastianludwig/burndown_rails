class CreateDataPoints < ActiveRecord::Migration
  def change
    create_table :data_points do |t|
      t.references :graph
      t.date :date
      t.integer :value

      t.timestamps
    end
  end
end
