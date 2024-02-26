const { Client } = require('pg');
const { getUsers } = require('../api');
const { mapUsers } = require('../utils/userUtils');

const config = {
  user: 'postgres',
  password: 'postgres',
  host: 'localhost',
  port: 5432,
  database: 'pfe-2023_1_lessons',
};

const client = new Client(config);

async function start() {
  const users = await getUsers();

  await client.connect();

  const result = await client.query(`INSERT INTO users (
    "first_name",
    "last_name",
    "email",
    "is_male",
    "balance",
    "height",
    "birthday"
  )
  VALUES
  ${mapUsers(users)}
  RETURNING *;`);
  // користувачі
  console.log(result.rows);

  await client.end();
}

start();
