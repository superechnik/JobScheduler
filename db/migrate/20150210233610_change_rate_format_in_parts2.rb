class ChangeRateFormatInParts2 < ActiveRecord::Migration
  

 def up

    change_column :parts, :rate, :decimal

  end
  

  def down

   change_column :parts, :rate, :float

  end



end
