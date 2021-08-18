class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :post_id
      t.integer :owner

      t.timestamps
    end
  end
end
