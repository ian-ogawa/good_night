class UserFollower < ApplicationRecord
	belongs_to :following, class_name: 'User'
	belongs_to :follower, class_name: 'User'
	validates_uniqueness_of :follower_id, scope: :following_id, message: "user already followed"

	enum follow_status: { follow_active: 'follow_active', follow_inactive: 'follow_inactive' }
end
