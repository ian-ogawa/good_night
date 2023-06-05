# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
	has_many :clock_ins, dependent: :destroy
	has_many :followers, class_name: 'UserFollower', foreign_key: 'following_id'
	has_many :followings, class_name: 'UserFollower', foreign_key: 'follower_id'
	
	validates :name, presence: true, uniqueness: true
end
