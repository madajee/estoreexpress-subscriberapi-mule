# estoreexpress-subscriberapi-mule

### Overview
Features: [register, login] [pub-sub with userq vm]

### view
![alt text](https://github.com/madajee/estoreexpress-subscriberapi-mule/blob/main/exchange-docs/estoreexpress-subscriberapi-mule.png?raw=true)

### Test
curl --location 'http://localhost:8081/api/createuser' \
--header 'Content-Type: application/json' \
--data '{"username":"test1","password":"test","name":"testname"}'


curl --location 'http://localhost:8081/api/updateuser' \
--header 'Content-Type: application/json' \
--data '{"username":"test1","password":"test", "lastlogin": "2016-01-01"}'


curl --location 'http://localhost:8081/api/readuser'

curl --location 'http://localhost:8081/api/deleteuser' \
--header 'Content-Type: application/json' \
--data '{"username":"test1","name":"testname"}'

curl --location 'http://localhost:8081/api/testuserq' \
--header 'Content-Type: application/json' \
--data '{"msgtype":"register","message":{"username":"john","password":"test","name":"John"}}'

curl --location 'http://localhost:8081/api/testuserq' \
--header 'Content-Type: application/json' \
--data '{"msgtype":"login","message":{"username":"john","password":"test","lastlogin":"2017-01-01"}}'