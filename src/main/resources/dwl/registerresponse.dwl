%dw 2.0
output application/json
---
{
	"status": "success",
	"message": "registration processed successfully for " ++ payload.username
}