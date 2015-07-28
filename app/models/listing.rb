class Listing < ActiveRecord::Base

	belongs_to :product

	has_many :photos, :foreign_key => "listing_id", :dependent => :destroy

	accepts_nested_attributes_for :photos, :allow_destroy => true

end
