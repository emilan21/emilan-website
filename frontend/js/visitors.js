//Your API
const API = 'https://7voh9igajc.execute-api.us-east-1.amazonaws.com/eric_milan_dev_prod/counts/get';

//The data you are sending to API Gateway/Lambda
const sendData = { id: 0 };

fetch(API, {
  method: 'POST',
  statusCode: 200,
  headers: {
	"Content-Type": "application/json"
  },
  body: JSON.stringify(sendData)
})
.then((response) => response.json())
.then((data) => {
    //handle data
	if (data.body.count) {
		document.getElementById("visits").innerHTML = data.body.count;
	} else {
		document.getElementById("visits").innerHTML = "0";
	}
})
.catch(error => {
    //handle error
	document.getElementById("visits").innerHTML = "NA";
});
