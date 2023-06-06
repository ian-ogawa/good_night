module UserFollowerAccessor
	def self.included(base)
    base.class_eval do
      def self.unfollow_user(follower_id, following_id)
				user_follower_data = UserFollower.find_by(follower_id: follower_id, following_id: following_id)
				return { is_success: false, message: 'User are not followed yet' } if user_follower_data.nil?

				if user_follower_data.update!(follow_status: "follow_inactive")
					message = 'Unfollow success'
					is_success = true
				else
					message = 'Unfollow failed'
					is_success = false
				end

				{ is_success: is_success, message: message }
			end
    end
  end
end