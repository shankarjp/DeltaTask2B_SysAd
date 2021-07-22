const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');

const db = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : 'password',
    database : 'mominfo'
});

db.connect((err) => {
    if(err){
        throw err;
    } else {
        console.log('MySQL Connected...');
    }
});

const app = express();

app.set('view engine', 'ejs');

app.use(bodyParser.urlencoded({extended: true}));

app.get('/', (req, res) => {
    let sql = 'SELECT * FROM mominfo';
    let query = db.query(sql, (err, results) => {
        if(err) {
            throw err;
        } else {
            console.log(results);
        }
    });
});

app.listen(3000, () => {
    console.log('Server running at port 3000');
});