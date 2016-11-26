class CreateCrimes < ActiveRecord::Migration
  def change
    create_table :crimes do |t|
      t.integer :objid
      t.datetime :time
      t.string :district
      t.string :type
      t.string :streets
      t.string :string
      t.float :longitude
      t.float :latitude

      t.timestamps null: false
    end
  end
end
