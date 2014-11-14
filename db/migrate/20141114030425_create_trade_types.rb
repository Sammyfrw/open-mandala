class CreateTradeTypes < ActiveRecord::Migration
  def change
    create_table :trade_types do |t|
      t.integer :type_id
      t.integer :group
      t.string :symbol_name
      t.string :description
      t.string :deposit_description
      t.string :withdrawal_description

      t.timestamps
    end
  end
end
