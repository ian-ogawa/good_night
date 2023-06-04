class V1::UsersController < ApplicationController
	before_action :user_params

	def create
		user = User.new(user_params)
    
    if user.save
      status = :created
    else
      status = :unprocessable_entity
      message = user.errors.full_messages
    end

    json_response({ user: user }, status, message)
	end

	private
		def user_params
			params.require(:user).permit(:name)
		end
end
