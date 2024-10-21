var mysql = require('mysql2');
// var faker = require('faker');
const { faker } = require('@faker-js/faker');



var connection = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : 'kaser',
    database : 'lms'
  });
   



















  

//   1. Create table [[ Books  ]] using Node JS -> How Am I greate person :)
    
var create_table = 'Create Table books ( id INT PRIMARY KEY AUTO_INCREMENT, title VARCHAR(255) NOT NULL, author Varchar(50) NOT NULL)';

connection.query(create_table, function(err, result) {
    console.log(err);
    console.log(result);
  });

//   2. Create table [[ members ]]  using Node JS -> How Am I greate person :)
    
// var create_table = 'CREATE TABLE members ('
//    + ' id INTEGER PRIMARY KEY AUTO_INCREMENT,'
//    + ' name VARCHAR(50) NOT NULL,'
//    + ' contact_number VARCHAR(50),'
//    + ' membership_type VARCHAR(10)'
//    + ')';


// connection.query(create_table, function(err, result) {
//     console.log(err);
//     console.log(result);
//   });


  


  //   3. Create table [[ loans ]]  using Node JS -> How Am I greate person :)
    
// var create_table2 = 'CREATE Table loans ( loan_id INTEGER PRIMARY KEY AUTO_INCREMENT, book_id INT, member_id INT, taken_date TIMESTAMP NOT NULL, return_date TIMESTAMP NOT NULL,'
//     + 'FOREIGN KEY (book_id) REFERENCES books(id),'
//     + 'FOREIGN KEY (member_id) REFERENCES members(id) )';


// connection.query(create_table2, function(err, result) {
//     console.log(err);
//     console.log(result);
//   });

// --------------------------------------------------------------------    --------------------------------
// --------------------------------------------------------------------    --------------------------------
// ---------------------INSERTING DATA TO The 3 TABLES-----------------    -------------------------------
// --------------------------------------------------------------------    --------------------------------
// --------------------------------------------------------------------    --------------------------------



// --------------------------------------------------------------------    --------------------------------
//  Insert INTO [[ BOOKS ]] table with 50 rows USING Node JS  ------
// --------------------------------------------------------------------    --------------------------------


//      var books_add = [];
//   for(var i = 0; i < 50; i++){
//     books_add.push([
//              faker.lorem.sentence(3), // Generate a sentence of 3 words as the title
//              faker.internet.userName(), // Generate a random author name
//       ]);
//   }

//     var q = 'INSERT INTO books (title, author) VALUES ?';

   
//     connection.query(q, [books_add], function(err, result) {
//     console.log(err);
//     console.log(result);
//   });



var q = 'SELECT COUNT(*) as count FROM users';

connection.query(q, function(err, results){
    if (err) throw err;


});




// --------------------------------------------------------------------    ------------------------------
//  Insert TO [[ MEMBERS ]] table with 50 rows USING Node JS  ------
// --------------------------------------------------------------------    --------------------------------


// Function to generate fake data using Faker.js
// function generateFakeMember() {
//     const membershipTypes = ['Basic', 'Premium', 'Gold'];
  
//     return {
//       name: faker.internet.displayName(), 
//       contact_number: faker.phone.number(),
//       membership_type: getRandomArrayElement(membershipTypes),
//     };
//   }
  
//   // Function to get a random element from an array
//   function getRandomArrayElement(array) {
//     const randomIndex = Math.floor(Math.random() * array.length);
//     return array[randomIndex];
//   }
  
//   // Function to insert fake data into the "members" table
//   function insertFakeMembers(numRecords) {
//     const fakeMembers = [];
  
//     for (let i = 0; i < numRecords; i++) {
//       fakeMembers.push(generateFakeMember());
//     }
  
//     const sql = 'INSERT INTO members (name, contact_number, membership_type) VALUES ?';
//     const values = fakeMembers.map(member => [member.name, member.contact_number, member.membership_type]);
  
//     connection.query(sql, [values], (err, results) => {
//       //if (err) throw err;
//       console.log(err);
//       console.log(`${results.affectedRows} records inserted.`);
//       connection.end();
//     });
//   }
  
//   // Specify the number of records you want to create (50 in this case)
//   const numberOfRecords = 50;
  
  // Call the function to insert fake data into the "members" table
//   insertFakeMembers(numberOfRecords);


// -----------------------------





   
  connection.end();