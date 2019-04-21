require_relative 'spec_helper'

step 'GET/job?token=<token>' do |token|
	if token == "token_from_post"
		response_body = DataStore.use('POST_response_body')
		token = response_body['token']
	end
	response = HTTParty.get("#{ENV['LOCAL']}/job?token=#{token}", :headers => { 'Content-Type' => 'application/json' })
	
  DataStore.keep('GET_response_body', JSON.parse(response.body))
  DataStore.keep('GET_response_code', response.code)
end

step 'Validate GET response from <method>' do |method|
	case method
	when "POST_request"
		get_response = DataStore.use('GET_response_body')
		post_request_body = JSON.parse(DataStore.use('POST_request_body'))

		expect(get_response[0]['job']).to eq(post_request_body['actions'])
	else
	  "Error: method has an invalid value (#{method})"
	end
end

step 'GET/job' do ||
	response = HTTParty.get("#{ENV['LOCAL']}/job", :headers => { 'Content-Type' => 'application/json' })

  DataStore.keep('GET_response_body', JSON.parse(response.body))
  DataStore.keep('GET_response_code', response.code)
end

step 'GET/job?id=<id>' do |id|
	response = HTTParty.get("#{ENV['LOCAL']}/job?id=#{id}", :headers => { 'Content-Type' => 'application/json' })
	
  DataStore.keep('GET_response_body', JSON.parse(response.body))
  DataStore.keep('GET_response_code', response.code)
end

step 'GET/job?limit=<limit>' do |limit|
	response = HTTParty.get("#{ENV['LOCAL']}/job?limit=#{limit}", :headers => { 'Content-Type' => 'application/json' })

  DataStore.keep('GET_response_body', JSON.parse(response.body))
  DataStore.keep('GET_response_code', response.code)
end

step 'Validate the objects count <count>' do |count| 
	response_body = DataStore.use('GET_response_body')
	expect(response_body.count).to eq(count.to_i)
end

step 'Job node must be null' do 
	get_response = DataStore.use('GET_response_body')

	expect(get_response[0]['job']).to eq(nil)
end