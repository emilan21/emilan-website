import boto3

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('ViewCounts')


def lambda_handler(event, context):
    response = table.put_item(Item={
        'counts': 4,
    })
    return response
