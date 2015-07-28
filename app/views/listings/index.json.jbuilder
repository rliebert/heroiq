json.array!(@listings) do |listing|
  json.extract! listing, :id, :name, :images, :mfr_date, :serial_no, :rental_price_per_day, :rental_price_per_wk, :security_deposit_amt, :sale_price, :accept_offers
  json.url listing_url(listing, format: :json)
end
