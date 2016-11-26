class RenameTypeToCallType < ActiveRecord::Migration
  def change
    rename_column :crimes, :type, :call_type
  end
end
