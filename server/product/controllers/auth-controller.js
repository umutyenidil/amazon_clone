const UserModel = require('../models/user_model/user_model');

const errorHandler = require('../utilities/error-handler');
const crypt = require('../utilities/crypt');
const jwt = require('../utilities/jwt');

module.exports.signUp = async (incomingRequest, outgoingResponse) => {
    try {
        const { name, emailAddress, password } = incomingRequest.body;

        const isEmailUnique = await UserModel.isEmailUnique({ emailAddress });

        if (!isEmailUnique) {
            return outgoingResponse.status(400).json(
                {
                    message: "email already in use",
                }
            );
        }



        UserModel.create({ name, emailAddress, password })
            .then((user) => {
                return outgoingResponse.status(200).json(user);
            })
            .catch((validationError) => {
                let errors = errorHandler.mongooseValidationErrorHandler(validationError);

                return outgoingResponse.status(400).json(errors);
            });
    } catch (error) {
        return outgoingResponse.status(500).json(
            {
                errorMessage: error.message,
            }
        );
    }
};

module.exports.signIn = async (incomingRequest, outgoingResponse) => {
    try {
        const { emailAddress, password } = incomingRequest.body;

        const user = await UserModel.readByEmailAddress({ emailAddress });



        if (user == null) {
            return outgoingResponse.status(400).json(
                {
                    message: 'Email address or password is wrong',
                }
            );
        }

        const isPasswordMatched = await crypt.compare({
            value: password,
            hashedValue: user.password,
        });

        if(!isPasswordMatched){
            return outgoingResponse.status(400).json(
                {
                    message: 'Email address or password is wrong',
                }
            );
        }

        const token = jwt.generateToken({userId: user._id});

        return outgoingResponse.status(200).json({
            token,
            ...user._doc,
        });

    } catch (error) {
        return outgoingResponse.status(500).json(
            {
                errorMessage: error.message,
            }
        );
    }
};