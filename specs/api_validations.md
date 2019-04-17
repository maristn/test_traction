# API validations

Tests to validate scenarios with positive results.

tags: guest-connect-io, happypath, api

## POST 
Use POST and validate the response code, token and message returned.

tags: post, regression

* POST/job "post.json"
* "POST" Response code must be "200"
* Token must be created
* Message must be "The job is currently being processed. Use the provided token to retrieve the logs at a later time at /logs?token={token}"


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


## DELETE specific data using id
Use DELETE to remove an object specified by id. 
For this test I use the previous object created on POST.

tags: delete, id, regression

* POST/job "post.json"
* GET/job?token="token_from_post"
* DELETE/job?id="id_from_get"
* "DELETE" Response code must be "200"
