class ApplicationController < ActionController::Base
  layout "bootstrap"
  
 
  protect_from_forgery with: :exception
end
