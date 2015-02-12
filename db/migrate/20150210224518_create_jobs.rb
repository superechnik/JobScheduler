class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :job_id
      t.integer :priority
      t.integer :quantity
      t.date :date_due
      t.string :part_id

      t.timestamps
    end
  end
end
