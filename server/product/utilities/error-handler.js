module.exports.mongooseValidationErrorHandler = (validationError)=>{
    let errors = {};

    Object.keys(validationError.errors).forEach((key) => {
        errors[key] = validationError.errors[key].message;
    });

    return errors;
};