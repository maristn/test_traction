require_relative 'spec_helper'

step 'DELETE/job?id=<id>' do |id|
	if id == "id_from_get"
		response_body = DataStore.use('GET_response_body')
		id = response_body[0]['id']
	end	
	puts "#{ENV['LOCAL']}/job?id=#{id}"
	response = HTTParty.delete("#{ENV['LOCAL']}/job?id=#{id}", :headers => { 'Content-Type' => 'application/json' })

  DataStore.keep('DELETE_response_code', response.code)
end

step 'DELETE/job?token=<token>' do |token|
	if token == "token_from_get"
		response_body = DataStore.use('GET_response_body')
		token = response_body[0]['token']
	end	
	response = HTTParty.delete("#{ENV['LOCAL']}/job?token=#{token}", :headers => { 'Content-Type' => 'application/json' })

  DataStore.keep('DELETE_response_code', response.code)
end