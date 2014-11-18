class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.datetime :trade_date
      t.integer :user_id
      t.integer :ticker_id
      t.integer :trade_type_id
      t.float :num_units
      t.float :price
      t.integer :parent_id
      t.integer :withdrawal_id
      t.integer :deposit_id
      t.float :commission
      t.float :reg_fee
      t.float :strike
      t.datetime :expiration
      t.string :description

      t.timestamps
    end
  end
end
