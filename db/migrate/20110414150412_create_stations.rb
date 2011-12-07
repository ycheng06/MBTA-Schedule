class CreateStations < ActiveRecord::Migration
  def self.up
    create_table :stations do |t|
      t.string :line
      t.string :platformkey
      t.string :platformname
      t.string :stationname
      t.integer :platformorder
      t.boolean :startofline
      t.boolean :endofline
      t.string :branch
      t.string :direction
      t.string :stop_id
      t.string :stop_name
      t.decimal :stop_lat, :precision => 8, :scale => 6
      t.decimal :stop_lon, :precision => 8, :scale => 6

      t.timestamps
    end
  end

  def self.down
    drop_table :stations
  end
end
