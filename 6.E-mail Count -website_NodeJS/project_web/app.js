const express = require("express");
const app = express();
const mysql2 = require('mysql2');
var bodyParser  = require("body-parser");



app.set("view engine", "ejs");
app.use(bodyParser.urlencoded({extended: true}));
app.use(express.static(__dirname + "/public"));

var connection = mysql2.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : 'kaser',
    database : 'node_project'
  });
  

app.get("/", function(req, res){
    // console.log(req);
    // console.log("There is a request!");
    // res.send("You're on Home Page!");

    var q = 'SELECT COUNT(*) as count FROM users';

    connection.query(q, function(err, results){
        if (err) throw err;
        var count = results[0].count;
		//var msgToServer = console.log('The number of users here til now is : ' + count);
		//var msg = 'The number of users here til now is : ' + count;
		//res.send(msg);

        res.render("home", {count: count , message: "Kaser"});

    });
});


// app.post('/register', function(req,res){
//     var person = {email: req.body.email};
//     connection.query('INSERT INTO users SET ?', person, function(err, result) {
//     console.log(err);
//     console.log(result);
//     res.redirect("/");
//     });
//    });

app.post("/register", function(req,res) {

    //console.log(req.body);
    // console.log("register email: " + req.body.email);

    var person = {email: req.body.email};

    connection.query('INSERT INTO users SET ?', person, function(err, result) {
    // if (err) throw err;
    console.log(err);
    console.log(result);
    // res.send("Thank you for registering here.");
    res.redirect('/');
    });

});


app.get("/joke", function(req, res){
    var joke = "What do you call a dog that does magic tricks? A labracadabrador.";
    res.send(joke);
   });


app.get("/random_num", function(req, res){
    var num = Math.floor((Math.random() * 100) + 1);
    res.send("Your lucky number is " + num);
   });

// app.get();


app.listen(3000, function() {
	console.log("Server is running on 3000");
});