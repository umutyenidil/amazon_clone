const jsonwebtoken = require('jsonwebtoken');

// change this key
const key = 'key';

module.exports.generateToken = ({ userId }) => {
    const token = jsonwebtoken.sign({ id: userId }, key);

    return token;
};