json.array!(@mechanics) do |mechanic|
  json.extract! mechanic, :id, :document, :name, :lastname, :address, :phone
  json.url mechanic_url(mechanic, format: :json)
end
