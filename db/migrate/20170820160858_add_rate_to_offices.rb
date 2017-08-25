class AddRateToOffices < ActiveRecord::Migration[5.1]
  def change
    add_column :offices, :occ_rate, :float
  end
end
