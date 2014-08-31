class InvoiceMaster < ActiveRecord::Base
	belongs_to :client
	has_one :order_master
end
