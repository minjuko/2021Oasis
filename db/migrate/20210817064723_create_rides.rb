class CreateRides < ActiveRecord::Migration[6.1]
  def change
    create_table :rides do |t|
      t.references :user, null: false, foreign_key: true
      t.string :departure
      t.string :arrival
      t.datetime :reservation
      t.integer :min
      t.string :max
      t.string :integer
      t.text :memo
      t.boolean :via
      t.boolean :samesex
      t.integer :left
      t.boolean :end

      t.timestamps
    end
  end
end
