const axios = require('axios');

const httpClient = axios.create({
  baseURL: 'https://randomuser.me/api/',
});

module.exports.getUsers = async () => {

  const axiosResponse = await httpClient.get('?results=200&seed=fd-2023-1-users');

  const { data: { results: users } } = axiosResponse;

  return users;
}