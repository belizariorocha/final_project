class AddLabelToDepartment < ActiveRecord::Migration[5.1]
  def change
    add_column :departments, :label, :string
  end
end
