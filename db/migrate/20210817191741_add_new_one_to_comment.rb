class AddNewOneToComment < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :ride_id, :integer
  end
end
