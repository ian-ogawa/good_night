class V1::UsersController < ApplicationController
	before_action :user_params, only: :create

	def index
		users = User.except_me(current_user.id)
		# users = User.all
		json_response({ users: users }, :ok)
	end

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
