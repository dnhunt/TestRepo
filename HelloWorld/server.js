var express = require('express');
var app = express();

var bodyParser = require('body-parser');

var port = process.env.port || 8080;

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

let helloName = "World";

app.get("/name",function(request,response) {
    response.json(`The current name is ${helloName}`);
});

app.get("/",function(request,response) {
  updateWebPage(response);
});
 
app.post('/', function (request, response) {
  helloName = request.body.name;
  updateWebPage(response);
});

app.listen(port, function (error) {
    if (error) throw error;
    var datetime = new Date();
    var message = "Server running on Port: " + port + ".  Started at :- " + datetime;
    console.log(message);
});

function updateWebPage(response) {
  response.write(
    `<html><body style="text-align:center;">
     <h1>Hello</h1>
     <h1 id="helloName">${helloName}</h1>
     <form action="/" method="post">
          <input type="text" name="name" 
              placeholder="New Name">
          <button type="submit" name="submit">
              Update Name
          </button>
     </form>
     </body></html>`);
  response.end();
}
