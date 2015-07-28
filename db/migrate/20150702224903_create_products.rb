class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :prod_type
      t.string :brand_name
      t.string :prod_name
      t.text :description

      t.timestamps null: false
    end
  end
end
