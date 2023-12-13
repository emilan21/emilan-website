import boto3

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('ViewCounts')


def lambda_handler(event, context):
    # Get current counts
    response = table.get_item(Key={'counts'})
    print(response['Item'])

    #new_count = response['Item'] + 1
    #response = table.put_item(Item={
    #    'counts': new_count,
    #})
    #return response
    return 0
