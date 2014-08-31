json.array!(@vehicles) do |vehicle|
  json.extract! vehicle, :id, :client_id, :model_id, :brand_id, :licencePlate, :year
  json.url vehicle_url(vehicle, format: :json)
end
