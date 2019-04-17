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

step 'Token must be created' do
	response_body = DataStore.use('POST_response_body')
	
	expect(response_body['token']).not_to be_empty
end

step 'Message must be <message>' do |message|
	response_body = DataStore.use('POST_response_body')

	expect(response_body['message']).to eq(message)
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

step 'DELETE/job?id=<id>' do |id|
	if id == "id_from_get"
		response_body = DataStore.use('GET_response_body')
		id = response_body[0]['id']
	end	
	response = HTTParty.delete("#{ENV['LOCAL']}/job?id=#{id}", :headers => { 'Content-Type' => 'application/json' })

  DataStore.keep('DELETE_response_code', response.code)
end


step 'Job node must be null' do 
	get_response = DataStore.use('GET_response_body')

	expect(get_response[0]['job']).to eq(nil)
end


#	puts response.body, response.code, response.message, response.headers.inspect


# file = File.open("data.json", "r")
#   data = file.read
#   file.close
  
# con = HTTParty.post('http://localhost:3000/job', :body =>data, :headers => { 'Content-Type' => 'application/json' })
 
# res = JSON.parse(con.body)

# token = res["token"]


# res = JSON.parse(con.body)

# puts res[0]["job"]



  #   headers = { content_type: :json, authorization: authorization, accept: :json }
  #   begin
  #     response = RestClient.post env + request_url, data.to_json, headers
  #   rescue Exception => detail
  #     response = detail.response
  #   ensure
  #     if response.code.equal? 204
  #       return { body: '', code: response.code, detail: response }
  #     end
  #     return { body: JSON.parse(response.body), code: response.code, detail: response }
  #   end
  # end



# order_request.receivers.each do |request_receivers|
#               if request_receivers.moipAccount.id == response_receivers.moipAccount.id
#                 if request_receivers.amount.percentual.present?
#                   expect(response_receivers.amount.total).to eq(CommonSteps.percent_of(response_receivers.amount.total, request_receivers.amount.percentual))
#                 elsif request_receivers.amount.fixed.present?
#                   # byebug
