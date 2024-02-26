const _ = require('lodash');

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

module.exports. mapUsers = mapUsers;