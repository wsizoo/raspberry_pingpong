class CreateSensors < ActiveRecord::Migration
  def change
    create_table :sensors do |t|
      t.string :status
      t.datetime :date_time

      t.timestamps null: false
    end
  end
end
