json.array!(@invoice_masters) do |invoice_master|
  json.extract! invoice_master, :id, :num_invoice, :client_id, :date, :total
  json.url invoice_master_url(invoice_master, format: :json)
end
