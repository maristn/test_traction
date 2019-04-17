# Error validations

Tests to validate scenarios with negative results.

tags: guest-connect-io, error, api

## POST an invalid json
Post an invalid json request, the "job" node on GET must be null.

tags: post, error

* POST/job "error.json"
* "POST" Response code must be "200"
* GET/job?token="token_from_post"
* Job node must be null 


## DELETE an inexistent id
Use DELETE to remove an inexistent object specified by id. 
For this test I use the previous object created on POST.

tags: delete, id, error

* POST/job "post.json"
* GET/job?token="token_from_post"
* DELETE/job?id="9999"
* "DELETE" Response code must be "404"







make request without results
mandar duas actions e ver o q acontece
