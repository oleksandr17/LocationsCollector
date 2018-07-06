import axios from 'axios';
import uuidv4 from 'uuid/v4';

const execute = (method, endpoint, data, config) =>
  axios({
    method,
    url: endpoint,
    data,
    config
  });

const get = (endpoint) =>
  execute('get', endpoint);

const post = (endpoint, data, config) =>
  execute('post', endpoint, data, config);

const put = (endpoint, data) =>
  execute('put', endpoint, data);

const patch = (endpoint, data) =>
  execute('patch', endpoint, data);

const del = (endpoint) =>
  execute('delete', endpoint);

export const genericErrorHandler = (error) =>
  console.log(error);

// post location

export const postLocation = (lat, lng) =>
  // axios({
  //   method: 'post',
  //   url: 'http://127.0.0.1:8000/v1/locations/list/',
  //   data: {
  //     sender_uuid: uuidv4,
  //     lat,
  //     lng
  //   }
  // });
  axios.post('http://127.0.0.1:8000/v1/locations/list/', {
    sender_uuid: "0eaed45f-af9f-40e0-902e-e5b3db35ee89",
    lat,
    lng
  });

