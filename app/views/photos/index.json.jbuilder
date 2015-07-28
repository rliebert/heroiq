json.array!(@photos) do |photo|
  json.extract! photo, :id, :image, :caption, :listing_id, :product_id
  json.url photo_url(photo, format: :json)
end
