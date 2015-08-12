class AddOwnerIdToListings < ActiveRecord::Migration
  def change
    add_column :listings, :owner_id, :integer
  end
end
