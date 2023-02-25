class AddOtypeToOperations < ActiveRecord::Migration[7.0]
  def change
    add_column :operations, :otype, :integer
    add_index :operations, :otype
  end
end
