require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "POST /v1/users" do
  	describe 'User created' do
  		it 'Creates a user' do
	    	post '/v1/users', params: {
	    		user: {
	    			name: 'user name'
	    		}
	    	}, headers: { "ACCEPT" => "application/json" }

	    	expect(response.content_type).to eq("application/json; charset=utf-8")
	    	expect(response).to have_http_status(:created)
	    end

	    it 'has user id' do
	    	post '/v1/users', params: {
	    		user: {
	    			name: 'user name'
	    		}
	    	}, headers: { "ACCEPT" => "application/json" }
	    	
	    	json_response = JSON.parse(response.body)
	    	expect(json_response["data"]["user"]["id"]).to_not eq(nil)
	    end
  	end

  	describe 'User was not created' do
	    it 'Renders an error status' do
	    	post '/v1/users', params: {
	    		user: {
	    			name: nil
	    		}
	    	}, headers: { "ACCEPT" => "application/json" }

	    	expect(response.content_type).to eq("application/json; charset=utf-8")
	    	expect(response).to have_http_status(:unprocessable_entity)
	    end

	    it 'Send null user id' do
	    	post '/v1/users', params: {
	    		user: {
	    			name: nil
	    		}
	    	}, headers: { "ACCEPT" => "application/json" }
	    	
	    	json_response = JSON.parse(response.body)
	    	expect(json_response["data"]["user"]["id"]).to eq(nil)
	    end
	  end
  end
end
