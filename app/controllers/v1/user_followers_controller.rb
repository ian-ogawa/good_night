class V1::UserFollowersController < ApplicationController
	before_action :user_follower_params, only: :create

	def create
		user_follower = UserFollower.new(user_follower_params)
    
    if user_follower.save
      status = :created
      message = ''
    else
      status = :unprocessable_entity
      message = user_follower.errors.full_messages
    end

    json_response_with_serializer(user_follower, status, message, {}, { adapter: :json, root: "user_follower" })
	end

	private
		def user_follower_params
			params.require(:user_follower).permit(:following_id, :follower_id)
		end
end
