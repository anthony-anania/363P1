import express from 'express'

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
