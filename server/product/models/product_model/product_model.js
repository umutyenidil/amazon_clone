const ProductMongooseModel = require('./product_mongoose_model');

class ProductModel {
    async create({ name, description, images, quantity, price, categoryId }) {
        return await ProductMongooseModel.create({
            name,
            description,
            images,
            quantity,
            price,
            categoryId,
        });
    }

    async read({ userId }) {
        const user = await ProductMongooseModel.read({ userId });

        return user;
    }

    async readByEmailAddress({ emailAddress }) {
        const user = await ProductMongooseModel.readByEmailAddress({ emailAddress });

        return user;
    }
}

const instance = Object.freeze(new ProductModel());

module.exports = instance;