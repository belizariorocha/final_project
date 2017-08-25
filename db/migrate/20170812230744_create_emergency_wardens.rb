class CreateEmergencyWardens < ActiveRecord::Migration[5.0]
  def change
    create_table :emergency_wardens do |t|
      t.string :role
      t.integer :office_id
      t.integer :staff_member_id
      t.string :acknowledged

      t.timestamps

    end
  end
end
