class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.string :part_id
      t.integer :rate
      t.integer :std_people

      t.timestamps
    end
  end
end
