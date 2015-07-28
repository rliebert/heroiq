json.array!(@products) do |product|
  json.extract! product, :id, :type, :brand_name, :model
  json.url product_url(product, format: :json)
end
