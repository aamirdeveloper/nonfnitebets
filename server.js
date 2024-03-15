const http = require("http");
const app = require('./app');
const port = 3000;

const server = http.createServer(app);

// server.listen(port);

app.listen(port, () => {
  console.log(`app listening at http://91.108.105.67:${port}`);
});
