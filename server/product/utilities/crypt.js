const bcryptjs = require('bcryptjs');

const passwordSalt = 8;

module.exports.cryptPassword = async ({ password }) => {
    const cryptedPassword = await bcryptjs.hash(password, passwordSalt);
    
    return cryptedPassword;
};