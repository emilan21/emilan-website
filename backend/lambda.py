import json
import boto3

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('ViewCounts')


def lambda_handler(event, context):
    data = json.loads(event["body"])
    table.put_item(Item={
        'counts': data['counts'],
    })
    respone = {'mes': 'Good input !'}
    return {'statusCode': 200, 'body': respone}
