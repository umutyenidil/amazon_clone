const express = require('express');

const UserModel = require('../models/user_model/user_model');
const { mongooseValidationErrorHandler } = require('../utilities/error-handler');

const router = express.Router();

router.post('/sign-up', async (incomingRequest, outgoingResponse) => {
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
                console.log(validation)
                let errors = mongooseValidationErrorHandler(validationError);

                return outgoingResponse.status(400).json(errors);
            });
    } catch (error) {
        return outgoingResponse.status(500).json(
            {
                errorMessage: error.message,
            }
        );
    }
});

module.exports = { router };