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

curl --location 'http://localhost:8081/api/createproduct' \
--header 'Content-Type: application/json' \
--data '{
    "title": "iPhone X",
    "description": "SIM-Free, Model A19211 6.5-inch Super Retina HD display with OLED technology A12 Bionic chip with ...",
    "price": 899,
    "discountPercentage": 12.96,
    "rating": 4.69,
    "stock": 94,
    "brand": "Apple",
    "category": "smartphones",
    "thumbnail": "https://www.publicdomainpictures.net/pictures/10000/velka/1-1210009435EGmE.jpg"
}'

curl --location 'http://localhost:8081/api/readproduct'

curl --location 'http://localhost:8081/api/updateproduct' \
--header 'Content-Type: application/json' \
--data '{
    "title": "iPhone X",
    "brand": "Apple",
    "rating": 8,
    "description": "SIM-Free, Model A19211 6.5-inch Super Retina HD display with OLED technology A12 Bionic chip with ...",
    "price": 899,
    "stock": 99
}'

curl --location 'http://localhost:8081/api/deleteproduct' \
--header 'Content-Type: application/json' \
--data '{
  "id": "13",
  "title": "iPhone X"
}'

curl --location 'http://localhost:8081/api/order' \
--header 'Content-Type: application/json' \
--data '{
    "customername": "John Doe",
    "ordertype": "WEB",
    "servicetype": "Azure",
    "userid" : "1",
    "odreritems": [
        {
            "productId": "1",
            "quantity": "1"
        },
        {
            "productId": "2",
            "quantity": "1"
        },
        {
            "productId": "3",
            "quantity": "1"
        }
    ]
}'

curl --location 'http://localhost:8081/api/readorders'

curl --location 'http://localhost:8081/api/orderitem' \
--header 'Content-Type: application/json' \
--data '[
    {
        "orderid": 1,
        "productid": 1,
        "quantity": 1
    },
    {
        "orderid": 1,
        "productid": 2,
        "quantity": 1
    }
]'

curl --location 'http://localhost:8081/api/orderstatus' \
--header 'Content-Type: application/json' \
--data '{
    "orderidentifier": "4fcffb3c-0d8d-4892-9a7b-2b81402de061",
    "status": "complete"
}'
