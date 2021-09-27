const http = require("http");
const app = require("./astrotak");
const port = process.env.PORT || 3000;
const server = http.createServer(app);


server.listen(port,()=>(console.log("app is running at loclahost 3000")));