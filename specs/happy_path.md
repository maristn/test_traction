# guest-connect-io

tags: guest-connect-io, happypath, api

## POST 
* POST /job "post.json"
* Response code must be "200"
* Token must be created
* Message must be "The job is currently being processed. Use the provided token to retrieve the logs at a later time at /logs?token={token}"

##GET all results
* GET all results
* Response code must be "200"

#GET specific data
* GET results from token "d048bca5-60f9-4823-b8f4-a4e16c1f8abf"