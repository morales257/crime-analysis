class RemoveStringFromCrimes < ActiveRecord::Migration
  def change
    remove_column :crimes, :string, :string
  end
end
