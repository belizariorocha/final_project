class CreateOffices < ActiveRecord::Migration[5.0]
  def change
    create_table :offices do |t|
      t.string :name
      t.string :city
      t.string :state
      t.text :address
      t.date :lease_expiry
      t.float :size
      t.float :annual_cost
      t.integer :department_id

      t.timestamps

    end
  end
end
