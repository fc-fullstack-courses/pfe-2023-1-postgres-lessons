const { Client } = require('pg');

const config = {
  user: 'postgres',
  password: 'postgres',
  host: 'localhost',
  port: 5432,
  database: 'pfe-2023_1_lessons',
};

const client = new Client(config);

async function start() {
  await client.connect();

  const result = await client.query('SELECT * FROM users;');
  // користувачі
  console.log(result.rows); 

  await client.end();
}

start();