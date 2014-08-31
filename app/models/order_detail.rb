class OrderDetail < ActiveRecord::Base
	belongs_to :order_master
	belongs_to :replacement
	
end
