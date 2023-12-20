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

    async readAll() {
        const user = await ProductMongoose.find();

        return user;
    }

    async deleteProduct({id}){
        const product = await ProductMongoose.findByIdAndDelete(id);
        await product.save();
    }

}

const instance = Object.freeze(new ProductMongooseModel());

module.exports = instance;