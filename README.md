# AWS-Project---Architect-and-Build-an-End-to-End-AWS-Web-Application-from-Scratch-Step-by-Step

AWS Project - Architect and Build an End-to-End AWS Web Application from Scratch, Step by Step

https://www.youtube.com/watch?v=7m_q1ldzw0U 

https://pages.awscloud.com/traincert-developer-hub.html?sc_channel=sm&sc_campaign=AWS_Training_and_Certification&sc_publisher=LINKEDIN&sc_country=AWS%20Training%20&%20Certification&sc_geo=GLOBAL&sc_outcome=adoption&trkCampaign=GLBL-FY21-TrainCert_OrganicSocial_LinkedIn_Developer&trk=1689c1a5-9024-4b68-ba54-5cb83bed71a0_LINKEDIN&sc_content=Developer&sc_category=AWS%20Training%20and%20Certification

Aws Aplify
Aws Lambda
Amazon API Gateway
Amazon DynamoDB
Aws Identity and  Access Management ( IAM )

A way to create/host web page
A way to invoke the math functionality 
A way to do some math
Somewhere to store/return the math result
A way to handle permissions

A way to create/host web page

The Application Architecture 
Amplify
Used to build and host websites ( but we will use a text editor to create a simple index.html page )
Index.html ( File ) 
<!DOCTYPE>
<html>
<head>
       <meta charset=“UTF-8”>
       <title>To the Power of Math</title>
</head>

<body> 
       To the Power of Math!
</body>
</html>

index.html
index.zip

Aws Console
Console Home
Search ( Aws Amplify )
New App
Host web app
Get started with Amplify Hosting
From your existing code
Deploy without git Provider
Continue 
Manual Deploy
Start a manual deployment 
App name ( PowerOfMath )
Environment name ( dev )
Drag and Drop ( - index.zip )
Save and deploy

PowerOfMath 
The app homepage lists all deployed frontend and backend environments.
Hosting environments
This tab lists all connected branches, selecting a branch to view build details.

Dev
      Deployment successfully completed
      Domain https://dev.d26u2yadfw1boy.aplifyapp.com             Last deployment 

Aws Aplify 
App settings
Domain management 

The Current Architecture 
User 
Web Page
Amplify 
Lambda ( Code that runs (serverlessly) upon some trigger

Python Math Library

Console Home
Search ( Lambda )

Functions                                                                Create function 
Create function
Author from scratch
Basic information 
Function name ( PowerOfMathFunction )
Runtime ( Python 3.9 )                                 Create function

PowerOfMathFunction
Code source                ( Deploy )

lambda_function
# import the JSON utility package
import json
# import the Python math library
import math

# define the handler function that the Lambda service will use an entry point
def lambda_handler(event, context):

# extract the two numbers from the Lambda service's event object
    mathResult = math.pow(int(event['base']), int(event['exponent']))

    # return a properly formatted JSON object
    return {
    'statusCode': 200,
    'body': json.dumps('Your result is ' + str(mathResult))
    }

Deploy 
Successfully updated the function PowerOfMathFunction
Test
Configure test event 
Configure test event
Event name ( PowerOfMathFunction )
Event JSON
{
       “base”: 2,
       “exponent”: 3
}
Save 
Test 
Test Event Name
PowerOfMathFunction
Response
{
       “statusCode”:  200,
       “body”: “\ “ Your result is 8.0\” “ 
}
Function Logs
…
Request ID
…

A way to invoke the math functionality 

The Application Architecture 
User 
Web Page
Amplify 
API Gateway ( Used to build, HTTP, REST and WebSocket APIs )
Lambda ( Code that runs (serverlessly) upon some trigger

Console Home
Search ( API Gateway )
API Gateway
APIs                                                             
Create API
            Rest API ( Develop a REST API where you gain complete control over the request and response along with APIs management capabilities. )  
Build
Choose the protocol
            REST
Create new API
New API
Settings 
API name ( PowerOfMathAPI )
           Create API 
Amazon API Gateway
API: PowerOfMathAPI
Resources
/
Actions ( Create Method )
Post
Post - Setup
Choose the integration point for your new method.
Integration type 
Lambda Function 
Use Lambda Proxy integration 
Lambda Function
PowerOfMathFunction
Save
Add Permission to Lambda Function
You are about to give API Gateway permission to invoke your Lambda function. 
Ok

Cors origin resource sharing   
Resources
/
POST 
Actions
Enable CORS
Enable CORS and replace existing CORS headers
Yes, replace existing values
Resources
/
POST 
Actions
Applications
Deploy API
Choose a stage where your API will be deployed. For example, a test version of your API could be deployed to a stage named beta
Deployment stage 
[New Stage]
Stage name
dev
Deploy 

dev Stage Editor
Invoke URL: https://xs7a22nv22.execute-api-us-west-2-amazonaws.com/dev ( API Gateway )

Resources
/
POST 
POST - Method Execution
Test ->
Method Request 
Auth NONE
Arn …
Integration Request 
Type: LAMBDA
Region: us-west-2
Integration Response
HTTP status pattern
Output passthrough: No
Method Response 
HTTP Status: 200
Models: application/json => Empty
Client  <-

Test
Post Method Test
Request Body
{
       “base”: 2,
       “exponent”: 4
}
Test

Request: /
Status: 200
Latency: 234 ms
ResponseBody
{
     “statusCode”:  200,
      “body”: “\ “ Your result is 16.0\” “ 

}
Response Headers
..
Logs
…

The Application Architecture 
User 
Web Page
Amplify 
API Gateway ( Used to build, HTTP, REST and WebSocket APIs )
Lambda ( Code that runs (serverlessly) upon some trigger
IAM ( Set permissions on the execution role for Lambda )
DynamoDB ( A key-value “NoSQL” database )

Console Home
Search ( DynamoDB )
Dashboard
Create Resources 
Create Table
Table details
Table name
PowerOfMathDatabase
Partition key
ID
Create Table 
Tables
PowerOfMathDatabase
General Information
Additional info 
Amazon Resource Name (ARN ) 
arn:aws-dynamodb-us-west-2:324712927967-table/PowerOfMathDatabase

Lambda UI 
Code
Test Event Name
PowerOfMathFunction
Response
{
       “statusCode”:  200,
       “body”: “\ “ Your result is 8.0\” “ 
}
Function Logs
…
Request ID
…
Configuration 
Permissions
Execution role
Role name
PowerOfMathFunction-role-m63i6i95
Summary
Permissions 
Add permissions
Create inline policy
Create policy
JSON
{
"Version": "2012-10-17",
"Statement": [
    {
        "Sid": "VisualEditor0",
        "Effect": "Allow",
        "Action": [
            "dynamodb:PutItem",
            "dynamodb:DeleteItem",
            "dynamodb:GetItem",
            "dynamodb:Scan",
            "dynamodb:Query",
            "dynamodb:UpdateItem"
        ],
        "Resource": "arn:aws-dynamodb-us-west-2:324712927967-table/PowerOfMathDatabase
"
    }
    ]
}

Review policy
Name
PowerOfMathDynamoPolice
Create policy

Lambda UI
PowerOfMathFunction
Code source                ( Deploy )

lambda_function
# import the JSON utility package
import json
# import the Python math library
import math

# import the AWS SDK (for Python the package name is boto3)
import boto3
# import two packages to help us with dates and date formatting
from time import gmtime, strftime

# create a DynamoDB object using the AWS SDK
dynamodb = boto3.resource('dynamodb')
# use the DynamoDB object to select our table
table = dynamodb.Table('PowerOfMathDatabase')
# store the current time in a human readable format in a variable
now = strftime("%a, %d %b %Y %H:%M:%S +0000", gmtime())

# define the handler function that the Lambda service will use an entry point
def lambda_handler(event, context):

# extract the two numbers from the Lambda service's event object
    mathResult = math.pow(int(event['base']), int(event['exponent']))

# write result and time to the DynamoDB table using the object we instantiated and save response in a variable
    response = table.put_item(
        Item={
            'ID': str(mathResult),
            'LatestGreetingTime':now
            })

# return a properly formatted JSON object
    return {
    'statusCode': 200,
    'body': json.dumps('Your result is ' + str(mathResult))
    }

Deploy 
Successfully updated the function PowerOfMathFunction
Test
{
       “base”: 2,
       “exponent”: 3
}
Save 
Test 
Test Event Name
PowerOfMathTestEvent
Response
{
       “statusCode”:  200,
       “body”: “\ “ Your result is 8.0\” “ 
}
Function Logs
…
Request ID
…

DynamoDB UI
PowerOfMathDatabase
Explore table items
Items returned
8.0 Thu, 23 jun 2022 00:25:22 + 0000

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>To the Power of Math!</title>
    <!-- Styling for the client UI -->
    <style>
    h1 {
        color: #FFFFFF;
        font-family: system-ui;
		margin-left: 20px;
        }
	body {
        background-color: #222629;
        }
    label {
        color: #86C232;
        font-family: system-ui;
        font-size: 20px;
        margin-left: 20px;
		margin-top: 20px;
        }
     button {
        background-color: #86C232;
		border-color: #86C232;
		color: #FFFFFF;
        font-family: system-ui;
        font-size: 20px;
		font-weight: bold;
        margin-left: 30px;
		margin-top: 20px;
		width: 140px;
        }
	 input {
        color: #222629;
        font-family: system-ui;
        font-size: 20px;
        margin-left: 10px;
		margin-top: 20px;
		width: 100px;
        }
    </style>
    <script>
        // callAPI function that takes the base and exponent numbers as parameters
        var callAPI = (base,exponent)=>{
            // instantiate a headers object
            var myHeaders = new Headers();
            // add content type header to object
            myHeaders.append("Content-Type", "application/json");
            // using built in JSON utility package turn object to string and store in a variable
            var raw = JSON.stringify({"base":base,"exponent":exponent});
            // create a JSON object with parameters for API call and store in a variable
            var requestOptions = {
                method: 'POST',
                headers: myHeaders,
                body: raw,
                redirect: 'follow'
            };
            // make API call with parameters and use promises to get response
            fetch("https://xs7a22nv22.execute-api-us.west-2.amazonaws.com/dev", requestOptions)
            .then(response => response.text())
            .then(result => alert(JSON.parse(result).body))
            .catch(error => console.log('error', error));
        }
    </script>
</head>
<body>
    <h1>TO THE POWER OF MATH!</h1>
	<form>
        <label>Base number:</label>
        <input type="text" id="base">
        <label>...to the power of:</label>
        <input type="text" id="exponent">
        <!-- set button onClick method to call function we defined passing input values as parameters -->
        <button type="button" onclick="callAPI(document.getElementById('base').value,document.getElementById('exponent').value)">CALCULATE</button>
    </form>
</body>
</html>

Amplify UI
PowerOfMath
Index.zip ( Drop file here )
Domain
https://dev.d26u2yadfw1boy.apliflyapp.com

TO THE POWER OF MATH
Base number: 2   …to the power of:   8   CAUCULATE
“Your result is 256.0”

Shut Down Your Resources

Amplify UI
Actions
Delete app
Delete your app ?
To confirm you want to delete app type delete in the field. 
Delete
Delete

DynamoDB
Tables
PowerOfMathDatabase
Delete
Delete table
To confirm the deletion of this table. type delete in the box. 
Delete
Delete table

Lambda UI
Functions
PowerOfMathFunction
Actions 
To confirm deletion. type delete in the field.
Delete
Delete
Close

Amazon API Gateway 
APIs
PowerOfMath
Actions
Delete
Delete API
Permanently delete the PowerOfMathAPI API?
This actions can´t be undone. Clientes will no longer to be able to reach its endpoints.
Delete




 

