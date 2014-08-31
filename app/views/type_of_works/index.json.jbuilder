json.array!(@type_of_works) do |type_of_work|
  json.extract! type_of_work, :id, :typeWork, :price, :description
  json.url type_of_work_url(type_of_work, format: :json)
end
