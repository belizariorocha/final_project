class CreateEmergencyEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :emergency_events do |t|
      t.date :date
      t.integer :emergency_type_id
      t.text :details
      t.integer :office_id

      t.timestamps

    end
  end
end
