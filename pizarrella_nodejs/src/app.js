const express= require('express');
const app= express();
const morgan= require('morgan');
const exphbs=require('express-handlebars')
const path=require('path')
var cors = require('cors')

//settings

app.set('port',process.env.PORT || 4000);

app.use(morgan('dev'));
app.use(express.urlencoded({extended:false}));
app.use(express.json());


app.use(cors());
app.use(require('./routes'));

app.use(express.static(path.join(__dirname,'public')));

module.exports=app;