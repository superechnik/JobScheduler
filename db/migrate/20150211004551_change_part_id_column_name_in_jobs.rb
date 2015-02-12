class ChangePartIdColumnNameInJobs < ActiveRecord::Migration
  






def up

rename_column  :jobs, :part_id, :part_num
rename_column  :parts, :part_id, :part_num

end


def down

rename_column  :jobs, :part_num, :part_id
rename_column  :parts, :part_id, :part_num

end

end
