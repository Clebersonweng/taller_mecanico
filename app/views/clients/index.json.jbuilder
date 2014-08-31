json.array!(@clients) do |client|
  json.extract! client, :id, :document, :name, :lastname, :address, :phone
  json.url client_url(client, format: :json)
end
