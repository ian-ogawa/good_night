require 'rails_helper'

RSpec.describe ClockIn, type: :model do
	describe 'Clock in sleep' do
		clock_in_sleep = FactoryGirl.create(:clock_in_sleep)
		clock_in_wakeup = FactoryGirl.create(:clock_in_wake_up)
	  describe 'Creation' do
	  	it 'Can be created' do
		  	expect(clock_in_sleep).to be_valid
			end
	  end

	  describe 'Validation' do
	  	it 'Can be create if user id not nil' do
				clock_in.user_id = nil
	      expect(clock_in).to_not be_valid
	  	end

	  	describe 'Sleep' do
		  	it 'Can be create if last clocked in is Wake Up' do
					
		  	end

		  	it 'Can not be later than latest wake up' do
		  		
		  	end
		  end

		  describe 'Wake up' do
		  	it 'Can be create if last clocked in is sleep' do
					
		  	end
		  end
	  end
	end
end
