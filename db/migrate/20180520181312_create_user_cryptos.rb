class CreateUserCryptos < ActiveRecord::Migration[5.2]
  def change
    create_table :user_cryptos do |t|
      t.references :user, foreign_key: true
      t.references :crypto, foreign_key: true

      t.timestamps
    end
  end
end
