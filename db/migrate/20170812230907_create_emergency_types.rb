class CreateEmergencyTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :emergency_types do |t|
      t.string :name
      t.text :details

      t.timestamps

    end
  end
end
