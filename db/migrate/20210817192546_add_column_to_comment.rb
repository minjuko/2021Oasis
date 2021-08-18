class AddColumnToComment < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :departure, :string
    add_column :comments, :arrival, :string
  end
end
