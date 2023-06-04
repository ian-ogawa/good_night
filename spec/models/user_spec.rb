# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Creation' do
  	it 'Can be created' do
	  	user = FactoryGirl.build_stubbed(:user)
	  	expect(user).to be_valid
		end
  end

  describe 'Validation' do
  	it 'Can be create if valid' do
  		user = FactoryGirl.build_stubbed(:user)
			user.name = nil
      expect(user).to_not be_valid
  	end

  	it 'Can not be duplicated' do
  		user_one = FactoryGirl.create(:user)
  		user_two = FactoryGirl.build_stubbed(:user)
      expect(user_two).to_not be_valid
  	end
  end
end
