const UserMongoose = require("./user_mongoose");

class UserMongooseModel {
    async isEmailUnique({ emailAddress }) {
        const existingUser = await UserMongoose.findOne({ emailAddress: emailAddress });

        return (existingUser) ? false : true;
    }

    async create({ name, emailAddress, password }) {
        let user = new UserMongoose({
            name,
            emailAddress,
            password,
        });

        user = await user.save();

        return user;
    }

    async readByEmailAddress({ emailAddress }) {
        let user = await UserMongoose.findOne({ emailAddress });

        return user;
    }
}

const instance = Object.freeze(new UserMongooseModel());

module.exports = instance;