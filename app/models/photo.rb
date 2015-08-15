class Photo < ActiveRecord::Base

	belongs_to :listing
	belongs_to :product

	has_attached_file :image,
		:styles => {
			:thumb => "100x100#",
			:medium => "400x400>",
			:large => "800x800>"
			},
		:path => ":style/:filename_:style",
		:default_url => "no-image_:style.png",
		:storage => :dropbox,
    	:dropbox_credentials => Rails.root.join("config/dropbox.yml")

  	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
