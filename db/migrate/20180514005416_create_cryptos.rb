class CreateCryptos < ActiveRecord::Migration[5.2]
  def change
    create_table :cryptos do |t|
      t.string :bitcurrency
      t.string :currency
      t.decimal :last

      t.timestamps
    end
  end
end
