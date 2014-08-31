json.array!(@brands) do |brand|
  json.extract! brand, :id, :brand, :description
  json.url brand_url(brand, format: :json)
end
