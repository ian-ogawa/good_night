class V1::UserFollowersController < ApplicationController
	before_action :user_follower_params, only: :create

	def index
		user_followers = current_user.followings
		json_response_with_serializer(user_followers, status, '', {}, { adapter: :json, root: "user" })
	end

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

	def unfollow
		unfollow_user = UserFollower.unfollow_user(current_user.id, params[:following_id])
    
    if unfollow_user[:is_success]
      status = :ok
      message = 'Unfollow success'
    else
      status = :unprocessable_entity
      message = unfollow_user[:message]
    end

    json_response({ user_follower: {} }, status, message)
	end

	private
		def user_follower_params
			params.require(:user_follower).permit(:following_id, :follower_id)
		end
end
