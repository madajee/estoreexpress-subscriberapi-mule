%dw 2.0
output application/json
---
{
	"status": "success",
	"message": "login processed successfully for " ++ payload.username
}