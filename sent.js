var fs = require('fs');
const querystring = require('querystring')
var parse_data = '';
var parse_dataA = '';
// parse_data = parse_data.split("=>")
var http = require('http');
http.createServer(function (req, res) {
  fs.readFile('data.txt', function(err, data) {
    querystring.parse(data," ",)
    parse_data = data
  });
  console.log(parse_data);
  // res.writeHead(200, {'Content-Type': 'text/html'});
  // var data = parse_data;
  // res.write(data);
  // res.end();
}).listen(8080);
