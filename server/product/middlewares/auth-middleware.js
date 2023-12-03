const jwt = require('../utilities/jwt');

const authMiddleware = async (incomingRequest, outgoingResponse, next) => {
    try {
        const token = incomingRequest.header('x-auth-token');

        if(!token){
            return outgoingResponse.status(401).json(
                {
                    message: 'Not auth token, access denied',
                }
            );
        }

        const isVerified = jwt.verifyToken({ token });

        if (!isVerified) {
            return outgoingResponse.status(401).json(
                {
                    message: 'Token verification failed, access denied',
                }
            );
        }

        incomingRequest.userId = isVerified.id;
        incomingRequest.token = token;

        next();
    } catch (error) {
        return outgoingResponse.status(500).json(
            {
                errorMessage: error.message,
            }
        );
    }
}

module.exports = authMiddleware;