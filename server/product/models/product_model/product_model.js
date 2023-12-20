const ProductMongooseModel = require('./product_mongoose_model');

class ProductModel {
    async create({ name, description, images, quantity, price, categoryId }) {
        return ProductMongooseModel.create({
            name,
            description,
            images,
            quantity,
            price,
            categoryId,
        });
    }

    async readAll() {
        return ProductMongooseModel.readAll();
    }
}

const instance = Object.freeze(new ProductModel());

module.exports = instance;