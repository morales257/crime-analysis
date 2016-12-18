class CreateNeighborhoods < ActiveRecord::Migration
  def change
    create_table :neighborhoods do |t|
      t.string :name
      t.text :coordinates

      t.timestamps null: false
    end
  end
end
