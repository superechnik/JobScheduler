class ChangeRateFormatInParts < ActiveRecord::Migration
  


  def up

    change_column :parts, :rate, :float

  end
  

  def down

   change_column :parts, :rate, :integer

  end



end
