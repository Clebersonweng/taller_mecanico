json.array!(@invoice_details) do |invoice_detail|
  json.extract! invoice_detail, :id, :type_of_work_id, :invoice_master_id, :order_master_id
  json.url invoice_detail_url(invoice_detail, format: :json)
end
