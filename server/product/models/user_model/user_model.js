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

    async read({ userId }) {
        const user = await UserMongooseModel.read({ userId });

        return user;
    }

    async readByEmailAddress({ emailAddress }) {
        const user = await UserMongooseModel.readByEmailAddress({ emailAddress });

        return user;
    }
}

const instance = Object.freeze(new UserModel());

module.exports = instance;