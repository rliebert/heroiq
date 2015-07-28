class AddProductIdToListings < ActiveRecord::Migration
  def change
    add_column :listings, :product_id, :integer
  end
end
