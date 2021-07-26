const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');

const db = mysql.createConnection({
    host     : 'mysql',
    user     : 'root',
    password : 'password',
    database : 'userinfo',
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

app.get('/createtable', (req, res) => {
    let sql = 'CREATE TABLE users(id int AUTO_INCREMENT, username VARCHAR(255), password VARCHAR(255), PRIMARY KEY(id))';
    db.query(sql, (err, result) => {
        if(err) {
            throw err;
        } else {
            console.log(result);
            res.send('Users table created...');
        }
    });
});

app.get('/', (req, res) => {
    res.render("home")
});

app.get('/register', (req, res) => {
    res.render("register")
});

app.post('/register', (req, res) => {
    let post = {username: req.body.username, password: req.body.password};
    let sql = 'INSERT INTO users SET ?';
    let query = db.query(sql, post, (err, result) => {
        if(err) {
            throw err;
        } else {
            res.redirect('/info');
        }
    });
});

app.get('/login', (req, res) => {
    res.render("login")
});

app.post('/login', (req, res) => {
    let post = {username: req.body.username, password: req.body.password};
    let sql = 'SELECT * FROM users WHERE ?';
    let query = db.query(sql, db.escape(post), (err, result) => {
        if(err) {
            throw err;
        } else {
            if(result !== null) {
                res.redirect('/info');
            }
        }
    });
});

app.get('/info', (req, res) => {
    let sql = 'SELECT * FROM mominfo';
    let query = db.query(sql, (err, results) => {
        if(err) {
            throw err;
        } else {
            console.log(results);
            res.render("index", {info: results});
        }
    });
});

app.post('/info', (req, res) => {
    let post = {date: req.body.date, user: req.body.user, mom: req.body.mom};
    let sql = 'INSERT INTO mominfo SET ?';
    let query = db.query(sql, post, (err, results) => {
        if(err) {
            throw err;
        } else {
            res.redirect('/info');
        }
    });
});

app.get('/filters', (req, res) => {
    res.render("filters");
});

app.post('/filters', (req, res) => {
    let date = req.body.fdate;
    let user = req.body.fuser;
    console.log(date);
    console.log(user);
    if((date !== '') && (user !== '')) {
        console.log("condition 1");
        let post = {date: date, user: user};
        let sql = 'SELECT * FROM mominfo WHERE ?';
        let query = db.query(sql, db.escape(post), (err, results) => {
            if(err) {
                throw err;
            } else {
                console.log(results);
                res.render("index", {info: results});
            }
        });
    } else if((date === '') && (user !== '')) {
        console.log("condition 2");
        let post = {user: user};
        let sql = 'SELECT * FROM mominfo WHERE ?';
        let query = db.query(sql, post, (err, results) => {
            if(err) {
                throw err;
            } else {
                console.log(results);
                res.render("index", {info: results});
            }
        });
    } else if((date !== '') && (user === '')) {
        console.log("condition 3");
        let post = {date: date};
        let sql = 'SELECT * FROM mominfo WHERE ?';
        let query = db.query(sql, post, (err, results) => {
            if(err) {
                throw err;
            } else {
                console.log(results);
                res.render("index", {info: results});
            }
        });
    } else {
        console.log("condition 4");
        res.redirect('/info');
    }
});

app.listen(3000, () => {
    console.log('Server running at port 3000');
});