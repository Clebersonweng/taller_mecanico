json.array!(@models) do |model|
  json.extract! model, :id, :brand_id, :model, :description
  json.url model_url(model, format: :json)
end
