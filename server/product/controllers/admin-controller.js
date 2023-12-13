const ProductModel = require('../models/product_model/product_model');

module.exports.productAdd = async (incomingRequest, outgoingResponse) => {
    try {
        const { name, description, images, quantity, price, categoryId } = incomingRequest.body;

        await ProductModel.create({
            name,
            description,
            images,
            quantity,
            price,
            categoryId,
        });

    } catch (error) {
        return outgoingResponse.status(500).json(
            {
                errorMessage: error.message,
            }
        );
    }
};