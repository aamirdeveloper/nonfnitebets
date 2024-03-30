const http = require("http");
const app = require('./app');
const port = 3000;

const server = http.createServer(app);

// server.listen(port);

app.listen(port, () => {
  console.log(`app listening at http://154.56.63.138:${port}`);
});