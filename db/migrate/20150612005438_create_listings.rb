class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :name
      t.text :description
      t.date :mfr_date
      t.string :serial_no
      t.decimal :rental_price_per_day
      t.decimal :rental_price_per_wk
      t.decimal :security_deposit
      t.decimal :sale_price
      t.boolean :accept_offers

      t.timestamps null: false
    end
  end
end
