const _ = require('lodash');
const {
  minBalance,
  maxBalance,
  isFloatBalance,
  minHeight,
  maxHeight,
} = require('../config/usersGeneration.json');

function mapUser(u) {
  const {
    name: { first, last },
    email,
    dob: { date: birthday },
    gender,
  } = u;

  const isMale = gender === 'male';

  const balance = _.random(minBalance, maxBalance, isFloatBalance);

  const height = _.random(minHeight, maxHeight);

  return `('${first}', '${last}', '${email}', ${isMale}, ${balance}, ${height}, '${birthday}')`;
}

const mapUsers = (usersArr) => usersArr.map((user) => mapUser(user)).join(',');

module.exports.mapUsers = mapUsers;
