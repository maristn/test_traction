# POST validations

tags: guest-connect-io, api, post


## POST 
Use POST and validate the response code, token and message returned.

tags: post, regression

* POST/job "post.json"
* "POST" Response code must be "200"
* Token must be created
* Message must be "The job is currently being processed. Use the provided token to retrieve the logs at a later time at /logs?token={token}"


## POST an invalid json
Post an invalid json request, the "job" node on GET must be null.

tags: post, error

* POST/job "error.json"
* "POST" Response code must be "200"
* GET/job?token="token_from_post"
* Job node must be null 