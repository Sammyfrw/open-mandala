class CreateTickers < ActiveRecord::Migration
  def change
    create_table :tickers do |t|
      t.integer :ticker_type_id
      t.string :ticker
      t.string :name

      t.timestamps
    end
  end
end
