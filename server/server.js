const express = require('express');
const connection = require('./config/db');

const app = express();
const PORT = process.env.PORT || 3000;

connection.query('SELECT * FROM Admin', (err, results) => {
  if (err) {
    console.error('Error executing query:', err.stack);
    return;
  }
  console.log('Database query results:', results);
});

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});