class ChangeRateToFloatInParts < ActiveRecord::Migration
  


def change
  

change_column :parts, :rate, :float

end


end
