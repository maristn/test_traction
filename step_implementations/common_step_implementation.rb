require_relative 'spec_helper'

step  '<method> Response code must be <code>' do |method, code|
	case method
	when "POST"
	  response_code = DataStore.use('POST_response_code')
	when "GET"
	  response_code = DataStore.use('GET_response_code')
	when "DELETE"
	  response_code = DataStore.use('DELETE_response_code')
	else
	  "Error: method has an invalid value (#{method})"
	end
	expect(response_code).to eq(code.to_i)
end

step 'Message must be <message>' do |message|
	response_body = DataStore.use('POST_response_body')

	expect(response_body['message']).to eq(message)
end