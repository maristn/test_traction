# DELETE validations

tags: guest-connect-io, api, delete


## DELETE specific data using id
Use DELETE to remove an object specified by id. 
For this test, use the previous object created on POST.

tags: delete, id, regression

* POST/job "post.json"
* GET/job?token="token_from_post"
* DELETE/job?id="id_from_get"
* "DELETE" Response code must be "200"


## DELETE without id
Use DELETE to remove without an specific id.

tags: delete, id, error

* DELETE/job?id=""
* "DELETE" Response code must be "400"


## DELETE an inexistent id
Use DELETE to remove an inexistent object specified by id. 
For this test, use the previous object created on POST.

tags: delete, id, error, bugged

* POST/job "post.json"
* GET/job?token="token_from_post"
* DELETE/job?id="XYZ"
* "DELETE" Response code must be "400"


## DELETE specific data using token

Use DELETE to remove an object specified by token. 
For this test, use the previous object created on POST.

tags: delete, token, error

* POST/job "post.json"
* GET/job?token="token_from_post"
* DELETE/job?token="token_from_get"