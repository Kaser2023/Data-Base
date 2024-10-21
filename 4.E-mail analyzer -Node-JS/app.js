const { faker } = require('@faker-js/faker');
const mysql = require('mysql2');

var con = mysql.createConnection({
  host: '127.0.0.1',
  user: 'root', // Use 'user' instead of 'username'
  database: 'node_project',
  password: 'kaser',
  // authPlugin: 'mysql_native_password' // Set the authentication plugin explicitly
});


// 4. Exercises


// Exercise 5
const q5 = 'SELECT CASE '
 + 'WHEN email LIKE "%@gmail.com" THEN "gmail" '
 + 'WHEN email LIKE "%@yahoo.com" THEN "yahoo" '
 + 'WHEN email LIKE "%@hotmail.com" THEN "hotmail" ' 
 + 'ELSE "other" '
 + 'end      AS provider, '
 + 'Count(*) AS total_users '
 + 'FROM   users '
 + 'GROUP  BY provider '
 + 'ORDER  BY total_users DESC'

con.query(q5, function (error, results, fields) {
  if (error) throw error;
  console.log(results);
});



// Exercise 4
const q4 = 'SELECT Count(*) AS yahoo_users FROM '
+
'  users WHERE  email LIKE "%@yahoo.com"';

con.query(q4, function (error, results, fields) {
  if (error) throw error;
  //console.log(results);
});


// Exercise 3
const q3 = 'SELECT Monthname(created_at) AS month,  Count(*)  AS count FROM   users GROUP  BY month ORDER  BY count DESC';

con.query(q3, function (error, results, fields) {
  if (error) throw error;
  //console.log(results);
});



// Exercise 2
const q2 = 'SELECT * FROM   users WHERE  created_at = (SELECT Min(created_at)  FROM   users)';

con.query(q2, function (error, results, fields) {
  if (error) throw error;
  //console.log(results);
});




// Exercise 1
 const q1 = 'SELECT  DATE_FORMAT(MIN(created_at), "%M %D %Y") as earliest_date  FROM users';

con.query(q1, function (error, results, fields) {
  if (error) throw error;
  //console.log(results);
});



// 3. Insert 500 USERS


// var data = [];
// for(var i = 0; i < 500; i++){
//     data.push([
//         faker.internet.email(),
//         faker.date.past()
//     ]);
// }
 
 
// var q = 'INSERT INTO users (email, created_at) VALUES ?';
 
// con.query(q, [data], function(err, result) {
//   console.log(err);
//   console.log(result);
// });
 


// 2. Insert using Node



// var person = {
//   email: faker.internet.email(),
//   created_at: faker.date.past()
// };
// console.log(person);
// console.log('/n');

// var end_result = con.query('INSERT INTO users SET ?', person, function(err, result) {
// if (err) throw err;
// console.log(result);
// });

// console.log('/n');


// console.log(end_result.sql);


// var person = {email: faker.internet.email()};

// con.query('INSERT INTO users SET ?', person, function(err, result) {
//  if (err) throw err;
//  console.log(result);
// });



// const q = 'SELECT created_at as earliest FROM users Order By created_at DESC limit 1';

// con.query(q, function (error, results, fields) {
//   if (error) throw error;
//   console.log(results[0]);
//   //console.log(results[1].email);
//  //console.log(results.length);

// });



// var data = [
//   ['blah@gmail.com', '2017-05-01 03:51:37'],
//   ['ugh@gmail.com', '2017-05-01 03:51:37'],
//   ['meh@gmail.com', '2017-05-01 03:51:37']
// ];

// var q = 'INSERT INTO users (email, created_at) VALUES ?';

// con.query(q, [data], function(err, result) {
// console.log(err);
// console.log(result);
// });

// var person = {email: 'Jenny467@gmail.com'};

// con.query('INSERT INTO users SET ?', person, function(err, result) {
//  if (err) throw err;
//  console.log(result);
// });

// var q = 'INSERT INTO users (email) VALUES ("rusty_the_dog@gmail.com")';
 
// con.query(q, function (error, results, fields) {
//   if (error) throw error;
//   console.log(results);
// });


// 1. SELECT Using Node

// const q = 'SELECT COUNT(*) as total FROM users';

// con.query(q, function (error, results, fields) {
//   if (error) throw error;
//   console.log(results);
//   //console.log(results[1].email);
//  //console.log(results.length);

// });









// con.query('SELECT 1 + 1 AS solution', function (error, results, fields) {
//   if (error) throw error;
//   console.log('The solution is: ', results[0].solution);
// });


// con.query('SELECT CURDATE()', function (error, results, fields) {
//   if (error) throw error;
//   console.log(results);
// });


// con.query('SELECT 1 + 5 As answer', function (error, results, fields) {
//   if (error) throw error;
//   console.log(results[0].answer);
// });


// var q = 'SELECT CURTIME() as time, CURDATE() as date, NOW() as now';
// con.query(q, function (error, results, fields) {
//   if (error) throw error;
//   console.log(results);
//   console.log(results[0].time);
//   console.log(results[0].date);
//   console.log(results[0].now);
// });


con.end();