class Client < ActiveRecord::Base
	has_many :vehicles
	has_many :invoice_masters
	has_many :order_masters
	validates_associated :vehicles
	validates :document, numericality: { only_integer: true }
	validates :name, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
	validates :lastname, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
	validates :address, presence: true
	validates :phone, presence: true, numericality: true

end
