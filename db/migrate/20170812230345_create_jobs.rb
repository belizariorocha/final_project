class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :name
      t.text :details
      t.float :fte_utilization
      t.integer :staff_member_id

      t.timestamps

    end
  end
end
