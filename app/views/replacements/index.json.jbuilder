json.array!(@replacements) do |replacement|
  json.extract! replacement, :id, :name, :brand, :purchasePrice, :salePrice, :description
  json.url replacement_url(replacement, format: :json)
end
