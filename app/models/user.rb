class User < ActiveRecord::Base 	
	validates :username, uniqueness: {message: "Can not repeat"}, presence: {message: "This field is required"}
	validates :password, presence: {message: "This field is required"}	
end
