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

module.exports.products = async (incomingRequest, outgoingResponse) => {
    try {
       const arrProducts = await ProductModel.readAll();

       return outgoingResponse.status(200).json(
        arrProducts,
       );

    } catch (error) {
        return outgoingResponse.status(500).json(
            {
                errorMessage: error.message,
            }
        );
    }
};

module.exports.productDelete = async (incomingRequest, outgoingResponse) => {
    try {
        const { id } = incomingRequest.body;

        const deletedProduct = await ProductModel.deleteProduct({
            id
        });

        outgoingResponse.status(200).json(deletedProduct);
    } catch (error) {
        return outgoingResponse.status(500).json(
            {
                errorMessage: error.message,
            }
        );
    }
};