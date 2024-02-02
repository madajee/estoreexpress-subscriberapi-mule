# estoreexpress-subscriberapi-mule

### Overview
Features: [register, login]

### view
![alt text](https://github.com/madajee/estoreexpress-subscriberapi-mule/blob/main/exchange-docs/estoreexpress-subscriberapi-mule.png?raw=true)

### Test
curl --location 'http://localhost:8081/api/createuser' \
--header 'Content-Type: application/json' \
--data '{"username":"test1","password":"test","name":"testname"}'
Accepted Response: 
{"username":"test1","message":"success","name":"testname"}

curl --location 'http://localhost:8081/api/updateuser' \
--header 'Content-Type: application/json' \
--data '{"username":"test1","password":"test", "lastlogin": "2016-01-01"}'
Accepted Response: 
{"username":"test1","password":"test", "lastlogin": "2016-01-01"}

curl --location 'http://localhost:8081/api/readuser'
Accepted Response: 
{"message":"success","loggedin":"test1"}

curl --location 'http://localhost:8081/api/deleteuser' \
--header 'Content-Type: application/json' \
--data '{"username":"test1","name":"testname"}'
Accepted Response: 
{"message":"success","username":"test1","name":"testname"}