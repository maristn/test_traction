require 'httparty'
require 'json'

step 'POST /job <json_path>' do |json_path|

	file = File.open(json_path, "r")
	data = file.read
	file.close

	response = HTTParty.post('http://localhost:3000/job', :body => data, :headers => { 'Content-Type' => 'application/json' })

	puts response.body, response.code, response.message, response.headers.inspect

	@response_code =  response.code
end

step  'Response code must be "200"' do
	
end


step 'GET' do ||

	response = HTTParty.get('http://localhost:3000/job')

	puts response.body, response.code, response.message, response.headers.inspect
end





step 'Validate token and message' do
end