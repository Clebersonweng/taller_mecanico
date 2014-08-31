class Model < ActiveRecord::Base
	belongs_to :brand
	has_many :vehicles
	validates :brand, presence: {message: "This field is required"}
	validates :model, uniqueness: {message: "Can not repeat"}, presence: {message: "This field is required"}
	
end
