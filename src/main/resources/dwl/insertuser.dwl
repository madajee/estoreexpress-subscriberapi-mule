%dw 2.0
output application/json
---
{
	"username": payload.message.username,
	"password": payload.message.password
}