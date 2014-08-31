class Brand < ActiveRecord::Base
	has_many :models
	has_many :vehicles

	
	def self.search(search)  
		if search  
			where('brand LIKE ?', "%#{search}%")  
		else  
			
		end  
	end  
end
