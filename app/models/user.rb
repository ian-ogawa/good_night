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

	validates :name, presence: true, uniqueness: true
end
