# GET validations

tags: guest-connect-io, api, get


## GET specific data using token
Use GET to receive an object from a specific token.

tags: get, token, regression

* POST/job "post.json"
* GET/job?token="token_from_post"
* "GET" Response code must be "200"
* Validate GET response from "POST_request"


## GET specific data using id
Use GET to receive an object from a specific id.

tags: get, id

* GET/job?id="34"
* "GET" Response code must be "200"


## GET specific data using limit
The response must be the first objects listed and the amount defined. 

tags: get, id

* GET/job?limit="2"
* "GET" Response code must be "200"
* Validate the objects count "2"


## GET all results
Use GET to receive all objects registered.

tags: get

* GET/job
* "GET" Response code must be "200"


## GET specific data using an inexistent token
Use GET to receive an object from an inexistent token.
Expect to receive 400 code and a message explaining that the token wasn't found.

tags: get, token, bugged

* GET/job?token="XYZ"
* "GET" Response code must be "400"


## GET specific data using an inexistent id
Use GET to receive an object from a specific id.
Expect to receive 500 code and a message explaining that the id wasn't found.

tags: get, id, bugged

* GET/job?id="XYZ"
* "GET" Response code must be "400"


## GET specific data using an invalid limit
The response must be the first objects listed and the amount defined. 
If the limit is invalid, the response must contain all objects registered.

tags: get, id

* GET/job?limit="XYZ"
* "GET" Response code must be "200"