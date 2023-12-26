import requests

URL = 'https://7voh9igajc.execute-api.us-east-1.amazonaws.com/eric_milan_dev_prod/counts/get'
payload = {"id": 0}
headers = {"Content-Type": "application/json"}
results = []

for i in range(1000):
    jsonData = requests.post(URL, headers=headers, json=payload,
                             verify=False).json()
    results.append(jsonData['body']['count'])

print(f"Count: {results}")
