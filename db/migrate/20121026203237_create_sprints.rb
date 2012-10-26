class CreateSprints < ActiveRecord::Migration
  def change
    create_table :sprints do |t|
      t.integer :number

      t.timestamps
    end
  end
end
