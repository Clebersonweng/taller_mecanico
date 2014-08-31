class Mechanic < ActiveRecord::Base
	has_many  :order_masters
	validates :document, uniqueness: {message: "Can not repeat"}, presence: {message: "This field is required"}
	validates :name, presence: {message: "This field is required"}
	validates :lastname, presence: {message: "This field is required"}	
	validates :address, presence: {message: "This field is required"}
	validates :phone, presence: true
			
end
