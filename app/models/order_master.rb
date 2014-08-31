class OrderMaster < ActiveRecord::Base
	belongs_to :mechanic
	belongs_to :vehicle
	belongs_to :type_of_work
	belongs_to :client
	belongs_to :state
	has_many :order_detail
	has_one :invoice_master
end
