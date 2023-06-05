require 'rails_helper'

RSpec.describe "ClockIns", type: :request do
  describe "POST /v1/clock_ins" do
  	describe 'Clock in created' do
  		user = FactoryGirl.create(:user)

  		it 'Creates a clock in' do
	    	post '/v1/clock_ins', params: {
	    		clock_in: {
	    			user_id: user.id
	    		}
	    	}, headers: { "ACCEPT" => "application/json" }

	    	expect(response.content_type).to eq("application/json; charset=utf-8")
	    	expect(response).to have_http_status(:created)
	    end

	    it 'has clock in histories' do
	    	post '/v1/clock_ins', params: {
	    		clock_in: {
	    			user_id: user.id
	    		}
	    	}, headers: { "ACCEPT" => "application/json" }
	    	
	    	json_response = JSON.parse(response.body)
	    	expect(json_response["data"]["clock_in"]).to_not eq(nil)
	    end
  	end

  	describe 'Clock in was not created' do
	    it 'Renders an error status' do
	    	post '/v1/clock_ins', params: {
	    		clock_in: {
	    			user_id: nil
	    		}
	    	}, headers: { "ACCEPT" => "application/json" }

	    	expect(response.content_type).to eq("application/json; charset=utf-8")
	    	expect(response).to have_http_status(:unprocessable_entity)
	    end

	    it 'Send null user id' do
	    	post '/v1/clock_ins', params: {
	    		clock_in: {
	    			user_id: nil
	    		}
	    	}, headers: { "ACCEPT" => "application/json" }
	    	
	    	json_response = JSON.parse(response.body)
	    	expect(json_response["data"]["clock_in"]).to be_empty
	    end
	  end
  end
end
