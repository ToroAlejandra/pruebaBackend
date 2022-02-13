const express = require('express');
const app = express();
const morgan = require('morgan'); //morgan procesa datos antes de que el servidor los reciba 

const port = process.env.PORT || 8080;
app.set('port', port);
app.set('json spaces', 2);

//middlewares
app.use(morgan('dev'));
app.use(express.json());

//routes
app.use('/api/users',require('./routes/index.js'));
app.use('/api/users',require('./routes/users.js'));

app.listen(app.get('port'), () => {
    console.log('API escuchando en el puerto ' + app.get('port'));
});
