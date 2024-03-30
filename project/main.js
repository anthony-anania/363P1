import express from "express";
import mysql from "mysql2";

const PORT = 3000;
const dbport = 3301;
const dbhost = "localhost";
const dbname = "SOEN363A2";
const dbuser = "root";
const dbpass = "";

const app = express();

export const dbPool = mysql.createPool({
  host: dbhost,
  port: dbport,
  user: dbuser,
  database: dbname,
  password: dbpass,
});

app.listen(PORT, () => {
  console.log(`Server started on port ${PORT}`);
});

app.get("/", function (req, res) {
  res.send("heelloo");
});

app.get("/add", function (req, res) {

});


