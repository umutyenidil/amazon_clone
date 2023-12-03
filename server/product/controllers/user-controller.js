const UserModel = require('../models/user_model/user_model');

module.exports.data = async (incomingRequest, outgoingResponse) => {
    try {
        const userId = incomingRequest.userId;
        const userToken = incomingRequest.token;

        const user = await UserModel.read({userId});

        return outgoingResponse.status(200).json(
            {
                token: userToken,
                ...user._doc,
            }
        );

    } catch (error) {
        return outgoingResponse.status(500).json(
            {
                errorMessage: error.message,
            }
        );
    }
};