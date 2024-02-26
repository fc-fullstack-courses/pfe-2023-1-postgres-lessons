const { Client } = require('pg');

const config = {
  user: 'postgres',
  password: 'postgres',
  host: 'localhost',
  port: 5432,
  database: 'pfe-2023_1_lessons',
};

const client = new Client(config);

const u = {
  firstName: 'Inserted',
  lastName: 'User',
  email: 'ins_2@gmail.com',
  isMale: true,
  balance: 3501.55,
  height: 1.70,
  birthday: '1997-01-05'
}

async function start() {
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
  ('${u.firstName}', '${u.lastName}', '${u.email}', ${u.isMale}, ${u.balance}, ${u.height}, '${u.birthday}')
  RETURNING *;`);
  // користувачі
  console.log(result.rows); 

  await client.end();
}

start();