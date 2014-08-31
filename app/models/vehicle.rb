class Vehicle < ActiveRecord::Base
	belongs_to :client
	belongs_to :brand
	belongs_to :model
	has_many   :order_masters
	
end
