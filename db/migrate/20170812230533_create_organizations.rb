class CreateOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations do |t|
      t.text :name
      t.text :details

      t.timestamps

    end
  end
end
