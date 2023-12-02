const mongoose = require('mongoose');

const crypt = require('../../utilities/crypt');

const userSchema = mongoose.mongoose.Schema(
    {
        name: {
            required: true,
            type: String,
            trim: true,
        },
        emailAddress: {
            required: true,
            type: String,
            trim: true,
            validate: {
                validator: (value) => {
                    const emailRegex = /^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$/;
                    return value.match(emailRegex);
                },
                message: "Please enter a valid email address",
            }
        },
        password: {
            required: true,
            type: String,
            validate: {
                validator: (value) => {
                    return value.length >= 6;
                },
                message: "Password must be longer than 6 char or equal to 6 char",
            }
        },
        address: {
            type: String,
            default: '',
        },
        type: {
            type: String,
            default: "user",
        }
    }
);


userSchema.pre('save', async function (next) {

    this.password = await crypt.cryptPassword({ password: this.password });

    next();
});

const UserMongoose = mongoose.model('User', userSchema);

module.exports = UserMongoose;