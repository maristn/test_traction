require_relative 'spec_helper'

step 'POST/job <json_path>' do |json_path|
	file = File.open(json_path, "r")
	data = file.read
	file.close
 
	response = HTTParty.post("#{ENV['LOCAL']}/job", :body => data, :headers => { 'Content-Type' => 'application/json' })
	
	DataStore.keep('POST_request_body', data)
  DataStore.keep('POST_response_body', JSON.parse(response.body))
  DataStore.keep('POST_response_code', response.code)
end

step 'Token must be created' do
	response_body = DataStore.use('POST_response_body')
	
	expect(response_body['token']).not_to be_empty
end