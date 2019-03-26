class ApplicationController < ActionController::Base
	protect_from_forgery pretend: true
	add_flash_types :success, :danger, :info, :warning #from Bootstrap 
end
