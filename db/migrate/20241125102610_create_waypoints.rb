class CreateWaypoints < ActiveRecord::Migration[7.1]
  def change
    create_table :waypoints do |t|
      t.references :vehicle, null: false, foreign_key: true
      t.decimal :latitude, precision: 10, scale: 8, null: false
      t.decimal :longitude, precision: 11, scale: 8, null: false
      t.datetime :timestamp, null: false
      t.timestamps
    end
  end
end
