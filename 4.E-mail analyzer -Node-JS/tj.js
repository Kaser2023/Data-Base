const { faker } = require('@faker-js/faker');

const chance = require('chance');

// Create an instance of Chance
const c = new chance();


var newData = [];

for (var i = 0; i <10; i++){
    const email = c.email();
    const name = c.name();
    const address = c.address();

    newData.push( { email, name, address });

}

// console.log(newData);


// for (let i = 0; i < 10; i++) {
//     const email = c.email();
//     const name = c.name();
//     const address = c.address();
  
//     // Store or use the generated data (e.g., store in an array)
//     newData.push({ email, name, address });

//   }

// console.log(newData);

var data = [];
for(var i = 0; i < 10; i++){
    data.push([
        faker.internet.email(),
        faker.internet.password(),
        faker.internet.url(),
        faker.location.city(),
        // faker.date.past(),
        // faker.internet.emoji()
    ]);
}

console.log(data);

// const emails = data.map(item => item.email); // Extract just the email property using map

// console.log(emails); // Print the array of emails

// console.log(data[]);

function generateAddress(){
    console.log(faker.location.streetAddress());
    console.log(faker.location.city());
    console.log(faker.location.state());
  }
  
  generateAddress();