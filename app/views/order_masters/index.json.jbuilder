json.array!(@order_masters) do |order_master|
  json.extract! order_master, :id, :mechanic_id, :vehicle, :type_of_work, :date, :client_id, :description_problem, :description_work_research, :state_id
  json.url order_master_url(order_master, format: :json)
end
