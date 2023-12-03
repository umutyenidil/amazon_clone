const express = require('express');
const mongoose = require('mongoose');

const { HOST, PORT, DB_ADDRESS } = require('./server-config');

const { router: authRoutes } = require('./product/routes/auth-routes');
const { router: userRoutes } = require('./product/routes/user-routes');

const authMiddleware = require('./product/middlewares/auth-middleware');

const app = express();


app.use(express.json());
app.use('/api/auth', authRoutes);
app.use('/api/user', authMiddleware, userRoutes);

mongoose.connect(DB_ADDRESS)
    .then(() => {
        console.log(`DB CONNECTED (${DB_ADDRESS})`);
    })
    .catch(() => {
        console.log('DB CONNECTION FAILED');
    });

app.listen(PORT, HOST, () => {
    console.log(`CONNECTED (${HOST}:${PORT})`);
});