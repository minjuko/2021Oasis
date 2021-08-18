class RemoveFieldNameFromComment < ActiveRecord::Migration[6.1]
  def change
    remove_column :comments, :owner, :string
    remove_column :comments, :post_id, :integer
  end
end
