const UserMongooseModel = require('./user_mongoose_model');

class UserModel {
    async isEmailUnique({ emailAddress }) {
        return await UserMongooseModel.isEmailUnique({
            emailAddress,
        });
    }

    async create({ name, emailAddress, password }) {
        const user = await UserMongooseModel.create({
            name,
            emailAddress,
            password,
        });

        return user;
    }
}

const instance = Object.freeze(new UserModel());

module.exports = instance;