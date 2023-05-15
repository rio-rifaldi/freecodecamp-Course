import express from "express";
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const app = express();
const port = 3001

app.use(express.static('public'));
app.get("/", function (req, res) {
    res.sendFile(__dirname + '/views/index.html');
});



app.get("/api/hello", function (req, res) {
    res.json({ greeting: 'hello API' });
});

app.get("/api", (req, res) => {
    const now = new Date();
    res.json({ unix: now.getTime(), utc: now.toUTCString() })
});

app.get("/api/:date", (req, res) => {
    const paramsDate = req.params.date;
    const invalidDate = "Invalid Date";
    const date = parseInt(paramsDate) < 10000
        ? new Date(paramsDate)
        : new Date(parseInt(paramsDate))

    date.toString() === invalidDate
        ? res.json({ error: invalidDate })
        : res.json({ unix: date.valueOf(), utc: date.toUTCString() });
});


app.listen(port,() =>{
    console.log("port is runing on " + port);
} )