const express = require('express');
const mongoose = require('mongoose');

const { HOST, PORT, DB_ADDRESS } = require('./server-config');

const { router: authRoutes } = require('./product/routes/auth');

const app = express();


app.use(express.json());
app.use('/api', authRoutes);

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