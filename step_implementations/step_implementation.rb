require_relative 'spec_helper'

step 'POST /job <json_path>' do |json_path|
	file = File.open(json_path, "r")
	data = file.read
	file.close
 
	response = HTTParty.post("#{ENV['LOCAL']}/job", :body => data, :headers => { 'Content-Type' => 'application/json' })
	
	@response_code =  response.code
	@response_body = JSON.parse(response.body)
end

step  'Response code must be <code>' do |code|
	expect(@response_code.to_s).to eq(code)
end

step 'Token must be created' do
	expect(@response_body['token']).not_to be_empty
end

step 'Message must be <message>' do |message|
	expect(@response_body['message']).to eq(message)
end

step 'GET all results' do ||

	response = HTTParty.get("#{ENV['LOCAL']}/job", :headers => { 'Content-Type' => 'application/json' })

	@response_code =  response.code
	@response_body = JSON.parse(response.body)

#	puts response.body, response.code, response.message, response.headers.inspect
end

step 'GET results from token <token>' do |token|

	response = HTTParty.get("#{ENV['LOCAL']}/job?token=#{token}", :headers => { 'Content-Type' => 'application/json' })
	@response_code =  response.code
	@response_body = JSON.parse(response.body)

	expect(@response_body['token']).to eq(token)
end




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