class RemoveFieldNameFromRide < ActiveRecord::Migration[6.1]
  def change
    remove_column :rides, :max, :string
    remove_column :rides, :integer, :string
  end
end
