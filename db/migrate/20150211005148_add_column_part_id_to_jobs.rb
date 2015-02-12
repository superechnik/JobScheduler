class AddColumnPartIdToJobs < ActiveRecord::Migration
  


def change
  

add_column  :jobs, :part_id, :integer, :index=> true


end


end
