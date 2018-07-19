class CreateSunAngles < ActiveRecord::Migration[5.2]
  def change
    create_table :sun_angles do |t|
      t.time :time
      t.decimal :angle
      t.decimal :azimuth
      t.string :zipcode
      t.integer :month

      t.timestamps
    end
  end
end
