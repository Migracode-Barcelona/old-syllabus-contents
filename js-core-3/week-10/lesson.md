![](https://img.shields.io/badge/status-review-orange.svg)

# JS Core III - 1

**What will we learn today?**

* [Intro to ES6](#intro-to-es6)
* [Tracing Code](#tracing-code)
* [Debugging](#good-design)
* [Good Design](#good-design)
  * [Modules](#modules)
  * [Refactoring](#refactoring)

> Fork and Clone the [js-exercises-tdd repo](https://github.com/CodeYourFuture/js-exercises-tdd)



# Intro to ES6

ECMAScript 2015 (or ES6) is a significant update to JavaScript that introduces
new syntax for writing complex applications. 

## const and let

You have already come across the `var` keyword as a way to create new variables.
The `let` and `const` keywords are also used for variable creation, but the
variables created using these keywords have different scope. Var has "function
scope", whereas let and const have "block scope".

> Exercise: This **badly designed** function will throw the error `message is
> not defined`. What is the problem, and how could we fix it?

```js
function compareNumbers(m, n) {
  if (m < n) {
    let message = m + " is smaller than " + n;
  } else {
    let message = m + " is bigger than or equal to " + n;
  }

  return message;
}
```

The `const` keyword is similar to `let`, the only difference is that a variable
declared using `const` can't be changed after it is assigned.

> Exercise: What advantages might a block scope variable have over a function
> scope variable? In what situation might you want to use `const` instead of a
> variable that can be re-assigned?

> Exercise: Let's update this code to use `let` and `const` instead of `var`

```js
function getCircleArea(radius) {
  var pi = Math.PI;
  var rSquared = Math.pow(radius, 2);

  return pi * rSquared;
}

function getCircleAreas(radiusArr) {
  var areasArr = [];

  for (var i = 0; i < radiusArr.length; i++) {
    var circleArea = getCircleArea(radiusArr[i]);
    areasArr.push(circleArea);
  }

  return areasArr;
}
```

## Template literals

We do a lot of string concatenation in JavaScript - ES6 introduces a more
elegant way of accomplishing the same.

```js
function greeting(name) {
  return "Hello " + name + ", welcome to JS core 3!";
}
```

Rewriting this function in ES6, we have

```js
function greeting(name) {
  return `Hello ${name}, welcome to JS core 3!`;
}
```

## Arrow functions

ES6 also has a new way of declaring functions. Let's see how it works.

```js
// before 
function sum(a, b, c) {
  return a + b + c;
}

// ES6
const sum = (a, b, c) => {
  return a + b + c;
}
```

If the function only contains one expression, the curly braces and the `return` 
are optional and we can write the whole function in one line. 

```js
const sum = (a, b, c) => a + b + c;
```

> Exercise: Refactor the previous code to have a separate function that checks
> if gender is 'female' or not, and use it in sayGreeting. Let's try and make
> the code as compact as possible together using ES6 features.


## Default parameters 

ES6 allows us to declare defaults for function arguments. The default value is 
used when the argument/parameter is either missing or `undefined`. 

This function returns the sum of three numbers. Let's assume we want to use the 
same function with only two arguments: 

```js
// without default parameter
const sum = (a, b, c) => {
  c = c || 0;
  return a + b + c;
}

console.log(sum(1, 3, 4)) // 8
console.log(sum(2, 5)) // NaN

// with default parameter 
const sum = (a, b, c = 0) => {
  return a + b + c;
}
console.log(sum(2, 5)) // 7
```


## Destructuring

In ES6 we can extract data from objects or arrays using destructuring. 

```js
// before 
var chicken = {
  name: 'Maggie', 
  age: 2
}

var name = chicken.name;
var age = chicken.age;

var numbers = [1, 2];

var firstNumber = numbers[0];
var secondNumber = numbers[1];


// in ES6
const chicken = {
  name: 'Maggie', 
  age: 2
}

const { name, age } = chicken;

const numbers = [1, 2];

const [firstNumber, secondNumber] = numbers;

```


# Resources

* [ES6 features](http://es6-features.org/)
* [Let and const](http://wesbos.com/let-vs-const/)

## Tracing Code

What is Code? Computer code is a **set of rules or instructions**. It is made up of words and numbers and when you put them in the **right order** it will tell your computer what you want it to do. 

Let's trace these code samples together:

- [Sample 1](https://github.com/CodeYourFuture/js-exercises-tdd/blob/master/II.write-tests/01-greet-people/greet-people.js) 

- [Sample 2](https://github.com/CodeYourFuture/js-exercises-tdd/blob/master/II.write-tests/02-remove-vowels/remove-vowels.js) 

- [Sample 3](https://github.com/CodeYourFuture/js-exercises-tdd/blob/master/II.write-tests/03-remove-vowels-from-array/remove-vowels-in-array.js) 


# Debugging

Debugging is the process of finding and resolving defects or problems within a computer program that prevent correct operation of computer software or a system.

## Syntax bugs
A syntax bug is an error caused by something the programmer has typed – it could be a spelling mistake or a command that the computer doesn’t understand.

## Logical bugs
A logical bug is an error which means that even though the computer is able to carry out its instructions, it doesn’t act as the programmer intended or the user expects.

> Exercise: This website ([https://kabaros.github.io/dom-ajax-repo-solution](https://kabaros.github.io/dom-ajax-repo-solution)) has *bugs*. Use Chrome Developer Tools to find out what is causing these issues.

> Follow this tutorial about [Debugging with Chrome](https://developers.google.com/web/tools/chrome-devtools/javascript/)

> The terms "bug" and "debugging" are popularly attributed to Admiral Grace Hopper in the 1940s.[1] While she was working on a Mark II computer at Harvard University, her associates discovered a moth stuck in a relay and thereby impeding operation, whereupon she remarked that they were "debugging" the system

# Good Design

Design is important if we want our code to be understandable (both to other
humans, but also to us in the future), to be easy to use and easy to expand.

There are three main principles you need to know now: clarity, reusability and
extensibility. There are also others, but they are deeply related to these
three.

* Ease of Maintenance / Clarity
  * Naming
  * Commenting
  * Clear logic
  * Concise
  * Formatting
  * Avoiding Redundancy

* Reusability
  * DRY
  * Single Reponsibility
    * Avoiding global state (scope)
    * Predictability and Ease of testing

* Extensibility
  * Avoiding being unnecessarily specific (e.g. magic numbers)

Now let's take a look at a bigger example of a badly written function

```js
function myFunction(salary, taxCode, incomeTax1, incomeTax2, ownsCar) {
  var totalIncomeTax = incomeTax1 + incomeTax2;
  var studentLoan = (salary - 17775) * 0.09;
  var originalSalary = salary;
  var nationalInsurance = null;

  if (taxCode === "1150L") {
    nationalInsurance = salary * 0.1;
  } else if (taxCode === "ST") {
    nationalInsurance = salary * 0.05;
  } else {
    nationalInsurance = salary * 0.08;
  }

  var deductions = [nationalInsurance, totalIncomeTax, studentLoan];

  salary = salary - deductions[0];
  salary = salary - deductions[1];
  salary = salary - deductions[2];

  return (
    "Your gross income is £" +
    originalSalary.toString() +
    " and your net income is £" +
    salary.toString() +
    "."
  );
}

console.log(myFunction(28000, "1150L", 1000, 580, false));
```

What is wrong with this function?

1. Naming: the function has a bad name, myFunction() tells you nothing about
   what the function does. It's also considered bad practice to name variables
   vaguely by separating them through numbers (incomeTax1, incomeTax2, etc). If
   you find yourself doing this then you should either use an array (such as
   incomeTax[]).

2. Commenting: the function isn't documented at all. It's very difficult to
   understand what the function's purpose is and how each part of the code
   contributes to it. By writing comments, the coder communicates their
   reasoning and helps the function be human readable.

3. Layout/formatting: unnecessary spacing between the if and else statement.

4. Single responsibility: the function doesn't have a single purpose. It
   calculates national insurance and salary deductions. Maybe the national
   insurance calculation could be moved to a separate function.

5. Input variable being overwritten: the function requires gross salary (before
   deductions) and net salary (after deductions) the `salary` input variable is
   therefore copied into an `originalSalary` variable so that it can be changed.
   It would be much clearer to create a new `netSalary` variable and leave
   `salary` unmodified.

6. DRY principle: the function validates the DRY (Don't Repeat Yourself) rule.
   The line where a deduction is taken from the salary is repeated 3 times with
   different indices. This can be replaced with a `for` loop.

7. Magic numbers. The code contains a lot of magic numbers, including `17775`,
   `0.09` and `0.1`.

8. Useless parameters: the code contains a variable which isn't used. They
   should be removed because they are confusing. It is tempting when you're
   starting to code a function to add more parameters thinking that you might
   need them, but it's important to remove them if you don't end up using them.

> Exercise: Working in pairs, go through all of these issues and make
> appropriate improvements to the code.



### Refactoring

There are times when we want to make our code better without changing any
functionality, for example because we just learnt about a better way to solve a
certain problem (like, finding needles in haystacks). This is called
_refactoring_.

When previously **GREEN** code - working code! - suddenly does not work anymore,
we call this a _regression_. Our existing tests can make sure that when we
refactor, the functionality of our code actually stays the same, and does not
regress.

> Exercise: Refactor some of the exercise we've written tests for.

## Modules

So far, all our programs have been in their own single files. But Node programs
can become really large, and having all our code in only one file will not be
maintainable.

We can therefore split our code into so-called _modules_. A module is basically
a JavaScript file that makes its functionality available to other modules and
programs.

### Creating modules, exporting code

It is really simple to take existing JavaScript code and turn it into a module
by exporting its functionality:

```js
function printName(name) {
  console.log("My name is " + name);
}

module.exports = printName;
```

The key here is the line containing `module.exports`. As you see, this is an
assignment, and whatever is assigned to `module.exports` will be made available
to other modules and program when this file is imported.

### Using modules, importing code

But how do we make use of another module in our program? We need to _import_ it,
and this is done using a function called `require()`.

> There are different module formats for JavaScript. The one we are using here,
> which is natively supported by Node, is called **CommonJS**.

```js
var printName = require("./printName.js");
```

> The string passed to the `require()` function is a _path_ to the file you are
> importing. `./` signifies the current directory, so the above command will
> import a file called "printName.js" that is in the same directory as our
> program.

Assuming our program is in the same folder as `printName.js`, we can use the
above code to import the functionality provided by that module and store it in
the `printName` variable.

We can then continue to use the `printName` function as if it we defined it in
our own program!

```
var printName = require('./printName.js');

printName();
```

> Modules can not only export functions, but all variable types you already
> learned about. Most commonly, they export a function or an object containing
> multiple functions.

> _Together:_ Edit the file `modules/main.js` and follow the instructions.



# Glossary

You should know these terms by the end of this class: Testing, Quality Assurance, Unit Tests, Integration Tests, Refactoring, Regression Tests .. any more?

# Resources

1. [JavaScript: The Good Parts by Douglas Crockford, chapter 4 - Functions](http://bdcampbell.net/javascript/book/javascript_the_good_parts.pdf)
2. [MDN Objects basics](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Objects/Basics)
3. [MDN OOP in JS](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Objects/Object-oriented_JS)
4. [Test-driven development](https://en.wikipedia.org/wiki/Test-driven_development)
5. [Jest](https://facebook.github.io/jest/)
6. [Modules](https://nodejs.org/api/modules.html)
7. [Setup VS Code for Debugging](https://medium.com/software-developer/debugging-facebooks-jest-for-react-in-visual-studio-code-9059223e1e71)

## Tracing code resources

Check out these videos. They contain code that is not JavaScript being traced on paper.

[Hand Tracing - Intro to Java Programming](https://www.youtube.com/watch?v=TZss5ukwN8s)

[Tracing code by hand](https://www.youtube.com/watch?v=tJGrie7k97c)

[Tracing a flowchart](https://www.youtube.com/watch?v=SEtNBShckCg)

[Java Tracing Arrays Worksheet 1](https://www.youtube.com/watch?v=niwBxBUzDu4)

[Nested loops](https://www.youtube.com/watch?v=5mxT9x5rgCg)

{% include "./homework.md" %}
