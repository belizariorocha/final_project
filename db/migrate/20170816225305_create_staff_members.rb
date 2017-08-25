class CreateStaffMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :staff_members do |t|
      t.text :name
      t.text :email
      t.string :telephone
      t.string :photo
      t.text :em_contact_name
      t.text :em_contact_email
      t.string :em_contact_telephone
      t.integer :organization_id
      t.integer :office_id

      t.timestamps

    end
  end
end
