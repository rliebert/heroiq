class Product < ActiveRecord::Base

	has_many :listings
	has_many :photos, :foreign_key => "product_id", :dependent => :destroy

	accepts_nested_attributes_for :photos, :allow_destroy => true

end
