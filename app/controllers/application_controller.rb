class ApplicationController < ActionController::API
	include Response

	private
		def current_user id = nil
			user_id = params[:user_id] || id
			User.find_by(id: user_id)
		end
end
