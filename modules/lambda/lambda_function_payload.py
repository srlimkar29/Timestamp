# Import the json utility package since we will be working with a JSON object
import json

# Import the AWS SDK (for Python the package name is boto3)
import boto3

# Import two packages to help us with dates and date formatting
from time import gmtime, strftime

# Create a DynamoDB object using the AWS SDK
dynamodb = boto3.resource('dynamodb')

# Use the DynamoDB object to select our table
table = dynamodb.Table('DynamoDB-Timestamp')

# Store the current time in a human readable format in a variable
now = strftime("%a, %d %b %Y %H:%M:%S +0000", gmtime())

# Define the handler function that the Lambda service will use as an entry point
def lambda_handler(event, context):

    name = event.get('firstName')


    response = table.put_item(
                  Item={
                     'ID' : name,
                     'Time': now
                       })
# Return a properly formatted JSON object
    return {
      'statusCode': 200,
      'body': json.dumps('Hello from Lambda ' + name)
    }
