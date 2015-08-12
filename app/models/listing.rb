class Listing < ActiveRecord::Base

	belongs_to :product
	belongs_to :owner, class_name: "User"

	has_many :photos, :foreign_key => "listing_id", :dependent => :destroy

	accepts_nested_attributes_for :photos, :allow_destroy => true

	validates :name, :description, presence: true
	validates :rental_price_per_day, :rental_price_per_wk, :sale_price, numericality: { greater_than: 0 }

end
