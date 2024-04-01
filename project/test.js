const mysql = require('mysql');
const fs = require('fs');
const csv = require('csv-parser');

// Create a MySQL connection
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'your_username',
  password: 'your_password',
  database: 'your_database'
});

// Connect to the database
connection.connect((err) => {
  if (err) throw err;
  console.log('Connected to MySQL database');
  
  // Insert data from orders.csv
  fs.createReadStream('orders.csv')
    .pipe(csv())
    .on('data', (row) => {
      connection.query('INSERT INTO orders SET ?', row, (err, res) => {
        if (err) throw err;
        console.log('Inserted row into orders table');
      });
    })
    .on('end', () => {
      console.log('Finished inserting data from orders.csv');
    });

  // Insert data from aisle.csv
  fs.createReadStream('aisle.csv')
    .pipe(csv())
    .on('data', (row) => {
      connection.query('INSERT INTO aisle SET ?', row, (err, res) => {
        if (err) throw err;
        console.log('Inserted row into aisle table');
      });
    })
    .on('end', () => {
      console.log('Finished inserting data from aisle.csv');
    });

  // Insert data from order_products_train.csv
  fs.createReadStream('order_products_train.csv')
    .pipe(csv())
    .on('data', (row) => {
      connection.query('INSERT INTO order_products_train SET ?', row, (err, res) => {
        if (err) throw err;
        console.log('Inserted row into order_products_train table');
      });
    })
    .on('end', () => {
      console.log('Finished inserting data from order_products_train.csv');
    });

  // Insert data from order_products_prior.csv
  fs.createReadStream('order_products_prior.csv')
    .pipe(csv())
    .on('data', (row) => {
      connection.query('INSERT INTO order_products_prior SET ?', row, (err, res) => {
        if (err) throw err;
        console.log('Inserted row into order_products_prior table');
      });
    })
    .on('end', () => {
      console.log('Finished inserting data from order_products_prior.csv');
    });

  // Insert data from products.csv
  fs.createReadStream('products.csv')
    .pipe(csv())
    .on('data', (row) => {
      connection.query('INSERT INTO products SET ?', row, (err, res) => {
        if (err) throw err;
        console.log('Inserted row into products table');
      });
    })
    .on('end', () => {
      console.log('Finished inserting data from products.csv');
    });

  // Insert data from departments.csv
  fs.createReadStream('departments.csv')
    .pipe(csv())
    .on('data', (row) => {
      connection.query('INSERT INTO departments SET ?', row, (err, res) => {
        if (err) throw err;
        console.log('Inserted row into departments table');
      });
    })
    .on('end', () => {
      console.log('Finished inserting data from departments.csv');
    });

});

// Close the connection when done
connection.end((err) => {
  if (err) throw err;
  console.log('MySQL connection closed');
});
