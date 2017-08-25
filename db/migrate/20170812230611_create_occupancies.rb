class CreateOccupancies < ActiveRecord::Migration[5.0]
  def change
    create_table :occupancies do |t|
      t.integer :organization_id
      t.integer :office_id
      t.integer :staff_count

      t.timestamps

    end
  end
end
