class CreateTrainsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :trains do |t|
      t.string :line_color
      t.string :series
      t.integer :cars
      t.string :destination_name
    end
  end
end
