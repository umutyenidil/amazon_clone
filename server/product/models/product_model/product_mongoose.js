const mongoose = require('mongoose');

const crypt = require('../../utilities/crypt');

const productSchema = mongoose.mongoose.Schema(
    {
        name: {
            required: true,
            type: String,
            trim: true,
        },
        description: {
            required: true,
            type: String,
            trim: true,
        },
        images: [
            {
                type: String,
                required: true,
            }
        ],
        quantity: {
            type: Number,
            required: true,
        },
        price: {
            type: Number,
            required: true,
        },
        categoryId: {
            type: String,
            required: true,
        }

    }
);
 
const ProductMongoose = mongoose.model('Product', productSchema);

module.exports = ProductMongoose;