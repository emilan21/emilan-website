import os
import boto3


def lambda_handler(event, context):
    session1 = boto3.Session(profile_name='Production-Account.Developer')
    id = event["id"]
    visit_count = 0

    # Create a Dynamodb client
    dynamodb = session1.resource('dynamodb')
    table_name = os.environ["TABLE_NAME"]
    table = dynamodb.Table(table_name)

    # Get the current visit count
    response = table.get_item(Key={"id": id})
    if "Item" in response:
        visit_count = response["Item"]["count"]

    # Increment the number of visits.
    visit_count += 1

    # Put the new visit count into the table.
    table.put_item(Item={"id": id, "count": visit_count})

    message = f"Page has been visited {visit_count} times."

    return {"message": message}
