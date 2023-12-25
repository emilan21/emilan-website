//Your API
const INCREMENT_API = 'https://7voh9igajc.execute-api.us-east-1.amazonaws.com/eric_milan_dev_prod/counts/increment';

//The data you are sending to API Gateway/Lambda
//const sendData = { id: 0 };

var hasVisited = sessionStorage.getItem('hasVisited');

if ( ! hasVisited ) {
	fetch(INCREMENT_API, {
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
	})
	.catch(error => {
	    //handle error
	});

    // do stuff
    sessionStorage.setItem('hasVisited', true);
}
