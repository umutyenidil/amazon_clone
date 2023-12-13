const ProductMongoose = require("./product_mongoose");

class ProductMongooseModel {
    async create({ name, description, images, quantity, price, categoryId }) {
        let product = new ProductMongoose({
            name,
            description,
            images,
            quantity,
            price,
            categoryId,
        });

        product = await product.save();

        return product;
    }

    async read({ userId }) {
        const user = await ProductMongoose.findById(userId);

        return user;
    }

    async readByEmailAddress({ emailAddress }) {
        let user = await ProductMongoose.findOne({ emailAddress });

        return user;
    }
}

const instance = Object.freeze(new ProductMongooseModel());

module.exports = instance;