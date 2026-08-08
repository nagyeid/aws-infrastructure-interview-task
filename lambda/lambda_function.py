from datetime import datetime, timezone


def lambda_handler(event, context):
    current_time = datetime.now(timezone.utc).isoformat()

    return {
        "statusCode": 200,
        "headers": {
            "Content-Type": "text/plain"
        },
        "body": current_time
    }