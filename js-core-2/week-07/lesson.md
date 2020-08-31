# JavaScript Core II - 1

## Before the class

- Fork the [Javascript/Core Module 2 repository](https://github.com/Migracode-Barcelona/exercises-js2) to your personal account and clone it. Find help in the [Migracode GIT Guide](/others/git.html#fork-and-clone-an-existing-project-from-github). This is the repo we will use during the first Javascript module, and for homework.

## Contents

- [Objects](#objects)
- [Objects Get and Set](#objects-get-and-set)
- [More complex objects](#more-complex-objects)
- [Object methods](#object-methods)
- [Arrays of Objects](#arrays-of-objects)
- [Object built-in methods](#object-built-in-methods)
- [Loop through an object](#loop-through-an-object)

---

## Learning Objectives

When you look at the world around you, what do you see? You see objects. In programming, objects are nothing more than representations of things. 
In this class you will learn how to manage objects, and arrays of objects.
By the end of this lesson students should be able to:

- Define what an object is in JavaScript
- Be able to write code that can use an object to store data
- Be able to write code that changes the properties of an object
- Be able to write code that can retrieve data from an object
- Write and call methods inside JavaScript objects
- Use Objects when contained inside an array
- Write code that uses objects built-in methods
- Write code that can iterate through an object

## Objects

Objects in the real world have properties that describe how they are unique. Your laptop, for example, has a brand (Lenovo/Apple etc.), a screen size (13/15 inch), RAM (8/16GB) etc.

How would we describe the above laptop as a JavaScript object?

```js
let laptop = {
  brand: "Lenovo",
  screenSize: 13,
  isTouchscreen: true,
};
```

### Exercise A-1 (5 min)

Describe your own laptop as a JavaScript object. Try to think of as many properties as you can!

Example:

```js
let laptop = {
  brand: "Lenovo",
  screenSize: 13,
  isTouchscreen: true,
};
```

### Exercise A-2 (5 min)

Think of 5 different real world "things" that you can describe with a JavaScript object
Assign each of them to a separate variable

Example:

```js
let car = {
    brand: "Seat",
    model: "Arona",
    color: "white",
    horsepower: 115,
    doors: 5
};
```

### Exercise A-3 (5 min)

```js
/*
The objects below have some syntax issues - try and fix them all!
*/

let kitten = {
    fur colour: "orange",
    age "23"
};

let laptop =
    brand: "Lenovo"
    ram "5GB"
}

let phone = {
    operating system "iOS",
    hasStylus: true,
    megapixels 12
    "batteryLife": "24 hours"
```

Useful words to remember when talking about objects:

- **object literal**: anything that has a set of `{...}` around a set of properties is an object literal
- **property** or **key**: `brand`, `screenSize` and `isTouchScreen` are properties/keys of the object
- **values**: `"Lenovo"`, `13` and `true` are values of the object's properties

## Objects Get and Set

### Getting the value of an object's property

Let's take one of the objects we looked at earlier..

```js
let laptop = {
  brand: "Lenovo",
  screenSize: 13,
  isTouchscreen: true,
};
```

> Try to `console.log(laptop)`. The output might depend on your environment!

To find out the value of an object's property, you can use the dot notation..

```js
console.log(laptop.brand);
```

You can also use the bracket notation (although this is rarely used, it's good to know):

```js
console.log(laptop["brand"]);
```

#### Exercise B-1 (5 min)

Console.log the values of each property of "kitten"

```js
/*
Console.log the values of each property of "kitten"
*/

let kitten = {
  ageMonths: 3,
  isFemale: true,
  furColour: "brown",
};
```

#### Exercise B-2 (5 min)

```js
/*
The following code contains syntax errors - try and fix them!
Once you fix them, run the code, it should output the correct values!
*/

let phone = {
    brand:'iPhone,
    model 'iPhone X'
    launchYear: 2017,
    is Unlocked: true
;

let phoneBrand = phone.bbrand;
let phoneLaunchYear = phone[launchYear];

console.log(phoneBrand);
console.log(phoneLaunchYear);

// -> it should output:
// iPhone
// 2017
```

### Setting the value of a property

Similar to reading, if we want to set a property:

```js
laptop.brand = "Apple";
```

It's strongly recommended you always use the same **type** when re-assigning an object's property (if it was a string before, keep it a string - and so on).

```js
let laptop = {
  brand: "Lenovo",
  screenSize: 13,
  isTouchscreen: true,
};

// DON'T DO THIS
laptop.screenSize = "15 inch";

// OK TO DO
laptop.screenSize = 15;
```

#### Exercise B-3 (5 min)

```js
/*
Write code in the space provided so that it outputs "Gilbert"
*/

// WRITE CODE BELOW THIS

// WRITE CODE ABOVE THIS

console.log(kitten.name);
// -> it should output: "Gilbert"
```

#### Exercise B-4 (5 min)

```js
/*
Write code in the space provided so that the expected values output
*/

let dog = {
  name: "Billy",
  wantsToPlay: false,
};

// WRITE CODE BELOW THIS LINE

// WRITE CODE ABOVE THIS LINE

console.log(dog.name);
console.log(dog.wantsToPlay);

// -> it should output:
// Rex
// true
```

## More Complex Objects

Object properties can even be assigned other objects, arrays or variables too. The example below shows an object with keys that have been assigned a variable, an array, and an object.

```js
let kittenName = "Feathers";

let kitten = {
  name: kittenName,
  toyCollection: ["blue ball", "green ball", "hoover box"],
  favoriteLocation: {
    roomName: "Living room",
    napPlace: "window",
    idealTemperatureCelsius: 24,
  },
};
```

#### Exercise C-1 (5 min)

```js
/*
Given the following house - follow the instructions below.

Make sure you run the file after and it outputs the correct results.
*/

let house = {
  address: "1 Kinning Park",
  previousOwners: ["Claire M.", "John A."],
  currentOwner: {
    firstName: "Margaret",
    lastName: "Conway",
  },
};

/*
  DO NOT EDIT ANYTHING ABOVE THIS LINE

  WRITE YOUR CODE BELOW
*/

// - change the address of "house" to '51 Berkley Road'
// - change the previous owners of "house" to ["Brian M.", "Fiona S."]
// - change the last name of the current owner of "house" to "Montgomery"

/*
  DO NOT EDIT ANYTHING BELOW THIS LINE
*/

console.log(
  `Expected result: 51 Berkley Road. Actual result: ${house.address}`
);
console.log(
  `Expected result: Brian M., Fiona S. Actual result: ${house.previousOwners.toString()}`
);
console.log(
  `Expected result: Montgomery. Actual result: ${house.currentOwner.lastName}`
);
```

#### Exercise C-2 (5 min)

```js
/*
Given the same "house" object again

Follow the instructions below and then run the file and make sure it outputs the correct results
*/

let house = {
  address: "1 Kinning Park",
  previousOwners: ["Claire M.", "John A."],
  currentOwner: {
    firstName: "Margaret",
    lastName: "Conway",
  },
};

let newCurrentOwner = {
  firstName: "Georgina",
  lastName: "Hernandez",
};

/*
  DO NOT EDIT ANYTHING ABOVE THIS LINE

  WRITE YOUR CODE BELOW
*/

// - assign the value of the variable 'newCurrentOwner' as the value to the house's "currentOwner"
// - from the list of previous owners, replace only "John A." with "Stephen B."
// - give the house a new property called 'isForSale' with the value 'false'

/*
  DO NOT EDIT ANYTHING BELOW THIS LINE
*/
console.log(
  `Did you correctly assign the new owner using the given variable?","Expected result: true. Actual result: " ${
    house.currentOwner === newCurrentOwner
  }`
);
console.log(
  `Expected result: Claire M., Stephen B. Actual result: ${house.previousOwners.toString()}`
);
console.log(`Expected result: false. Actual result: ${house.isForSale}`);
```

## Object Methods

Besides having specific properties, objects in the real world can also do things. For example, a computer can display something on the screen, a person can say their names etc... In Javascript, we do this using 'methods'. A method is a function attached to a particular object. You have already used some predefined methods before, for example _toUpperCase()_ on a string or _filter()_ on an array.

```js
let athlete = {
  name: "Usain Bolt",
  goldMedals: 25,
  sayHi: function () {
    return "Hi everybody!";
  },
};
```

How do we call this method?

```js
athlete.sayHi(); // returns "Hi everybody!"
```

An object method can also rely on the other properties of the object to do more complex calculation. To reference the current object in the body of the method, we will use the keyword _this_. Let's take an example.

```js
let athlete = {
  name: "Usain Bolt",
  goldMedals: 25,
  sayName: function () {
    return "My name is " + this.name;
  },
};

athlete.sayName(); // returns "My name is Usain Bolt"
```

Knowing this, you can have methods which modify existing properties of your object.

```js
let athlete = {
  name: "Usain Bolt",
  goldMedals: 25,
  winNewMedal: function () {
    this.goldMedals = this.goldMedals + 1;
  },
};

athlete.winNewMedal();
console.log(athelete.goldMedals); // prints "26"
```

As methods are just functions attached to objects, they can also take parameters.

```js
let athlete = {
  name: "Usain Bolt",
  goldMedals: 25,
  silverMedals: 7,
  winNewMedal: function (medal) {
    if (medal === "gold") {
      this.goldMedals = this.goldMedals + 1;
    } else {
      this.silverMedals = this.silverMedals + 1;
    }
  },
};

athlete.winNewMedal("silver");
console.log(athlete.goldMedals); // prints "25"
console.log(athlete.silverMedals); // prints "8"
```

#### Exercise D-1 (5 min)

```js
/*

A person named Alice is defined below.
  1. Add a method "greet" so this person can say hello.
  2. Add a method "sayName" so this person can say their own name. Hint: use 'this' keyword to access the name property.

*/

let person = {
  name: "Alice",
  age: 25,
};

/*
DO NOT EDIT ANYTHING BELOW THIS LINE
*/

console.log(
  `Expected result: Hello everybody. Actual result: ${person.greet()}`
);
console.log(
  `Expected result: 'My name is Alice'. Actual result: ${person.sayName()}`
);
```

#### Exercise D-2 (5 min)

The following code contains syntax errors - try and fix them!
Once you fix them, run this file, it should output the correct values!

```js
/*
The following code contains syntax errors - try and fix them!

Once you fix them, run this file, it should output the correct values!
*/

let person = {
    name: "Alice",
    age: 25,
    currentAddress: "Glasgow",
    changeAddress: (newAddress) {
        currentAddress = newAddress;
    },
    celebrateBirthday: function {
        that.age = that.age + 1;
    }
};
```

#### Exercise D-3 (5 min)

```js
/*
The following code contains syntax errors - try and fix them!

Once you fix them, run this file, it should output the correct values!
*/

let person = {
    name: "Alice",
    age: 25,
    currentAddress: "Glasgow",
    changeAddress: (newAddress) {
        currentAddress = newAddress;
    },
    celebrateBirthday: function {
        that.age = that.age + 1;
    }
};


/*
DO NOT EDIT ANYTHING BELOW THIS LINE
*/

person.changeAddress("Edinburgh");
console.log(`Expected result: Edinburgh. Actual result: ${person.currentAddress}`);

person.celebrateBirthday();
console.log(`Expected result: 26. Actual result: ${person.age}`);

```

## Arrays of objects

In the past weeks, you've learned about using arrays of numbers, arrays of string etc... In the following, we will learn how to use arrays of objects.

```js
let kitten1 = {
  name: "Fluffy",
  weeksOld: 2,
};

let kitten2 = {
  name: "Megatron",
  weeksOld: 1,
};

let kitten3 = {
  name: "Billy",
  weeksOld: 5,
};

let kittens = [kitten1, kitten2, kitten3];
```

You can also use all the functions for arrays that you learned before: find, some, every, filter, map, forEach... As an example, we want to filter all the kittens who are less than 3 weeks old:

```js
function isYoungerThan3Weeks(kitten) {
  return kitten.weeksOld <= 3;
}

kittens.filter(isYoungerThan3Weeks); // returns [kitten1, kitten2];
```

What if we want to get an array of all the kitties names?

```js
function getName(kitten) {
  return kitten.name;
}

kittens.map(getName); // returns ["Fluffy", "Megatron", "Billy"]
```

### Exercise E-1 (5 min)

```js
/*
1) Define an array containing the 3 persons defined below.
2) Return an array of the person names (hint: use map).
3) Filter the persons to return an array with the person younger than 28 years old (hint: use filter).
*/

let person1 = {
    name: "Alice",
    age: 25
};

let person2 = {
    name: "Bob",
    age: 30
};

let person3 = {
    name: "John",
    age: 20
};

/*
DO NOT EDIT ANYTHING ABOVE THIS LINE
WRITE YOUR CODE BELOW
*/


let persons = // Complete here

let personNames = // Complete here

let personsYoungerThan28YearsOld = // Complete here


/*
DO NOT EDIT ANYTHING BELOW THIS LINE
*/

console.log("Question 1: array defined with 3 persons -> ",
    (persons[0] === person1 && persons[1] === person2 && persons[2] === person3) ? 'Passed :)' : 'Not yet :(');

console.log("Question 2: array containing the person names -> ",
    (personNames[0] === "Alice" && personNames[1] === "Bob" && personNames[2] === "John") ? 'Passed :)' : 'Not yet :(');

console.log("Question 3: array containing the persons younger than 28 years old -> ",
    (personsYoungerThan28YearsOld[0] === person1 && personsYoungerThan28YearsOld[1] === person3) ? 'Passed :)' : 'Not yet :(');

```

### Exercise E-2 (5 min)

```js
/*
An array of travel destinations is defined below.
Each destination has a name, a distance from Glasgow, and a list of transportations available to go there.

1) Filter the travelDestinations array to return all destination names reachable within 500 kms.
2) Find a destination name reachable by ferry.
3) Print in the console all the destination names more than 300 kms far away and reachable by train.
*/


let destination1 = {
    destinationName: "Edinburgh",
    distanceKms: 80,
    transportations: ["car", "bus", "train"]
};

let destination2 = {
    destinationName: "London",
    distanceKms: 650,
    transportations: ["car", "bus", "train"]
};

let destination3 = {
    destinationName: "Paris",
    distanceKms: 900,
    transportations: ["train", "plane"]
};

let destination4 = {
    destinationName: "Dublin",
    distanceKms: 350,
    transportations: ["plane", "ferry"]
};

let travelDestinations = [destination1, destination2, destination3, destination4];

/*
DO NOT EDIT ANYTHING ABOVE THIS LINE
WRITE YOUR CODE BELOW
*/


let destinationNamesWithin500Kms = // Complete here

let destinationNameReachableByFerry = // Complete here

let destinationNamesMoreThan300KmsAwayByTrain = // Complete here (PRINT THE RESULT IN THE CONSOLE USING FOREACH)


/*
DO NOT EDIT ANYTHING BELOW THIS LINE
*/

console.log(`Question 1) Expected result: Edinburgh,Dublin, actual result: ${destinationNamesWithin500Kms}`);
console.log(`Question 2) Expected result: Dublin, actual result: ${destinationNameReachableByFerry}`);
console.log(`Question 3) Expected result: London,Paris, actual result:  ${destinationNamesMoreThan300KmsAwayByTrain}`);

```

## Object built-in methods

Since we started JavaScript, we have used `console.log` to print things to our console.

In week 2 and 3, you learned about array methods like `.map()`, and `.filter()`.

These are what we call built-in methods, and they're part of the JavaScript language. Someone else created these methods, and we can use them in our code.

Like arrays, objects have built-in methods that can help us. In this lesson, we will learn about `Object.keys()` and `Object.values()`.

### Object.keys()

This method goes into our object, and returns the object property names as an array.

Here is an example output for using `.keys()`:

```js
let car = {
  brand: "Seat",
  model: "Arona",
  color: "White",
};

console.log(Object.keys(car));
// prints [ 'brand', 'model', 'color' ]
```

### Object.values()

This method goes into our object, and returns the values of every property as an array.

Here is an example output for using `.values()`:

```js
let car = {
  brand: "Seat",
  model: "Arona",
  color: "White",
};

console.log(Object.values(car));
// prints [ 'Seat', 'Arona', 'White' ]
```

### Exercise F-1 (5 min)

```js
/*

Return the keys and values of the following object

*/

let capitalCities = {
  scotland: 'Edinburgh',
  kenya: 'Nairobi',
  australia: 'Canberra',
  canada: 'Ottawa'
};

let highScores = {
  55: 'Alistair',
  100: 'David',
  89: 'Hannah',
  34: ['Sergi', 'Frank',]
};

// ONLY EDIT BELOW HERE

let capitalCitiesKeys = ;
let highScoresKeys = ;
let capitalCitiesValues = ;
let highScoresValues = ;

// ONLY EDIT ABOVE HERE

console.log(capitalCitiesKeys);
// prints [ 'scotland', 'kenya', 'australia', 'canada' ]

console.log(highScoresKeys)
// prints ['34, '55', '89', '100']

console.log(capitalCitiesValues);
// prints [ 'Edinburgh', 'Nairobi', 'Canberra', 'Ottawa' ]

console.log(highScoresValues)
// prints [[ 'Sergi', 'Frank' ], 'Alistair, 'David', 'Hannah']

```

## Loop through an Object

Once in a while it will be required to loop through objects. You can achieve this in various ways.

### Use `for...in` statement

The `for...in` statement iterates over all distinct properties of an object.

Example:

```js
const flowers = {
  tulip: 20,
  rose: 10,
  lily: 15,
};

for (const key in flowers) {
  console.log(`${key}: ${flowers[key]}`);
}

// Prints
// tulip: 20
// rose: 10
// lily: 15
```

### Convert object into an array and loop through the array

Since we started JavaScript, we have used `console.log` to print things to our console.

Once you create an array of the object's keys or values using the `Object.keys`, `Object.values` methods, you can loop through it as if it was a normal array using array methods like `forEach`.

Example:

```js
const flowers = {
  tulip: 20,
  rose: 10,
  lily: 15,
};

// Looping through the array created from Object.keys
const flowerKeys = Object.keys(flowers);

flowerKeys.forEach((key) => {
  console.log(`${key}: ${flowers[key]}`);
});

// Prints
// tulip: 20
// rose: 10
// lily: 15
```

#### Exercise G-1 (5 min)

```js
// You are given an object of student names and grades
// Loop through all the students' grades and console log the name and grade of the ones with grade more than 18
// Try to use both methods shown above to achieve this

const studentGrades = {
  tom: 20,
  george: 17,
  abdul: 19,
};

// Prints
// TOM - 20
// ABDUL - 19
```

{% include "./homework.md" %}
