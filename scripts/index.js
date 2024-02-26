const { Client } = require('pg');
const _ = require('lodash');
const { getUsers } = require('../api');

const config = {
  user: 'postgres',
  password: 'postgres',
  host: 'localhost',
  port: 5432,
  database: 'pfe-2023_1_lessons',
};

const client = new Client(config);

function mapUser(u) {
  const {
    name: { first, last },
    email,
    dob: { date: birthday },
    gender,
  } = u;

  const isMale = gender === 'male';

  const balance = _.random(0, 5000, true);

  const height = _.random(1.5, 2);

  return `('${first}', '${last}', '${email}', ${isMale}, ${balance}, ${height}, '${birthday}')`;
}

const mapUsers = (usersArr) => usersArr.map((user) => mapUser(user)).join(',');

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
