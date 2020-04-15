![Draft lesson](https://img.shields.io/badge/status-draft-darkred.svg)

# JavaScript Core I - 3

**What we will learn today?**

In this class you will learn when and how use loops in a programming language, one of the most important utility of computers, that is repeat tasks in a very short time very easy.
To solve repetitive problems you will use loops `while` and `for` 
In addition, you will learn how to use `callback functions`   

## Index

* [Control Flow](#control-flow)
  * [Conditional Execution](#conditional-execution)
  * [While loops](#while-loops)
  * [For loops](#for-loops)
  * [Break a loop](#break-a-loop)
  * [Switch statement](#switch-statement)
  * [Other ways of looping](#other-ways-of-looping)
* [Callback functions](#callback-functions)
  * [Arrow functions](#arrow-functions)
  * [Chaining](#chaining)

## Control Flow

When we wrote our first lines of code we saw that the execution of the program was linear, the expressions executed in a determined order, from top to the bottom of the script.

```js
var age = 24;
console.log("John is " + age + "years old."); // John is 24 years old.
```

### Conditional execution

By introducing the `if` statement, a branch is created in the execution of the program. This is called **conditional execution**, where the logic is split into different branches:

```js
var age = 24;
if (age > 18) {
    console.log("John is an adult.")
} else {
    console.log("John is a young boy."); 
} 
```

The statements inside of each `{ }` represent each branch on the logic.

### While loops

Programs are very efficient when executing recurring tasks, but now imagine you are asked to log numbers from 1 to 100:

```js
console.log("The count is 1");
console.log("The count is 2");
console.log("The count is 3");
console.log("The count is 4");
console.log("The count is 5");
// ...
console.log("The count is 100");
```

Although this would work you would need to write 100 lines of code to achieve the desired output. A better solution for this problem would require that we could execute a block of code multiple times. This form of control is what we call a loop.

There are many ways to create a loop in a program, the first we will study is the `while` loop:

### `while ( ) { //... }`

```js
var count = 1;
while (count <= 100) {
  console.log("The count is: " + count);
  count += 1;
}
```

The `while` statement creates a loop. The syntax is somehow similar to the `if` statement, it evaluates a condition inside the parentheses `(true|false)` and then it executes the code inside the `{ }` block only if that condition evaluates to `true`. 

### Exercise

Log the Apollo 11 countdown, use the message provided as the last output.
It starts from 8 till 0!

```js
var apolloCountdownMessage = "all engine running... LIFT-OFF!";
var countdown = 8;

console.log(apolloCountdownMessage);
```

Expected output

```js
8
7
6
5
4
3
2
1
0
all engine running... LIFT-OFF!
```

### For loops

Alternatively we could use a `for loop`, which will do the same as the `while do` but in a shorter way:

```js
for (var count = 1; count <= 100; count += 1) {
  console.log("The count is: " + count);
}
```

This `for` loop it prints the same output as the `while` we study previously, the main difference is that the initialization, the condition, and the final-expression are grouped.

### `for (initialization; condition; final-expression) { //... }`

The initialization is `var count = 1`, the condition is `count <= 100` and the final-expression is `count += 1`. Those blocks can be seen inside the parentheses after the `for` keyword and separated by semicolons `;`, in the following order `(initialization; condition; final-expression)`.

### Exercise

Calculate the exponential of the even numbers from 5 to 20
Using a for loop and the helper functions provided.

```js
function exponential(number) {
  return number * number;
}

function isEven(number) {
  return number % 2 === 0;
}
```

Expected output

```js
The exponential of 6 is 36
The exponential of 8 is 64
The exponential of 10 is 100
The exponential of 12 is 144
The exponential of 14 is 196
The exponential of 16 is 256
The exponential of 18 is 324
```

### Break a loop

There might be cases where you would need to stop a loop from continuing its execution, and waiting for the defined condition to evaluate to `false` is not the only solution. To stop a loop we can use the keyword `break`, let see how:

```js
for (var count = 1; ; count += 1) {
  if (count <= 100) {
    console.log("The count is: " + count);
  } else {
    break;
  }
}
```

The provided code will output the same we saw on previous examples. This time the condition was moved to the body of the `for` loop to illustrate that:

1. Use `break` to stop a loop execution.
2. The condition in the `for` loop can be omitted.

### Exercise

Write a program that given an array of strings, logs the first one that has length greater than 6.

```js
const names = ["Daniel", "James", "Irina", "Mozafar", "Ashleigh"];
for (var i = 0; i < names.length; i++) {

}
```

### Switch statement

It's a common pattern to see code that looks like:

```js
if (os === "windows") startWindows();
else if (os == "linux") startLinux();
else if (os == "osx") startOSX();
else askForOS();
```

The `switch` statement is an alternative method to solve this same problem, see the following example:

```js
switch (os) {
  case "windows":
    startWindows();
    break;
  case "linux":
    startLinux();
    break;
  case "osx":
    startOSX();
    break;
  default:
    askForOS();
    break;
}
```

The program will evaluate the condition inside the parentheses `( )` and run the matching `case` statement. Note that after each statement there is a `break`, this ensures that the `switch` block exits, if omitted it will continue executing and might run code that was not intended to be run. 

### Exercise

Using a switch statement call the matching operative system function for each system:

* windows
* linux
* osx

Consider also the case where other values can be passed to the init function,
if the system is not supported call the function prompt

```js
function startWindows() {
  console.log("Windows has started");
}
function startLinux() {
  console.log("Linux has started");
}
function startOSX() {
  console.log("OSX has started");
}
function prompt() {
  console.log("The OS provided is not supported");
}

function init(os) {
  // write your code here
}

init("linux");
init("osx");
init("other");
```

Expected output

```js
Linux has started
OSX has started
The OS provided is not supported
```

### Other ways of looping

As studied in the previous class some array methods will loop through the items in the array and call a function. For example: 

```js
var names = ["Daniel", "Mozafar", "Irina"];
function loop(name, index) {
  console.log("The name " + name + " is at index " + index);
}
names.forEach(loop);
```

Just like `forEach` there are many others that will also loop the items of an array, here are some examples:

* `.every()`
* `.some()`
* `.map()`
* `.filter()`

Notice that those methods return an array when executed, on contrary to `forEach()` that returns `undefined`. This makes them ideal when you need to modify data contained on the array.

### Callback functions

A function that we provide to a method is commonly called a _callback_ function. The term highlights that although we _provide_ the `double` function, the `.map()` method _calls_ it. (Notice how we never write `double()` to call the function).

We'll see callback functions used a lot more in the coming weeks. 

Often, when a function is only needed for a map operation, it can be declared _inline_. Let's try copying and pasting the function declaration inside of the `.map()` method call.

```js
var numbers = [1, 2, 3];
var numbersDoubled = numbers.map(function double(number) {
  return number * 2;
});
```

We can make this shorter by removing the function name. We can do this because we are not using the function anywhere else in the code, so we do not need the function name to reference it.

```js
var numbers = [1, 2, 3];
var numbersDoubled = numbers.map(function (number) {
  return number * 2;
});
```

### Arrow functions

There is an alternative syntax to write a function that was introduced in newer versions of JavaScript (since ES6). It's called _arrow function_, lets see an example:

```js
var numbers = [1, 2, 3];
var numbersDoubled = numbers.map((number) => {
  return number * 2
});
```

The arrow function syntax lets you declare a function without the `function` keyword. (There are some other subtle differences between arrow functions and regular functions that you will learn later).

There is one last thing you can do to make your code shorter. If you remove the braces (`{}`) from an arrow function, the body of the function will be returned without needing to write the `return` keyword.

```js
var numbers = [1, 2, 3];
var numbersDoubled = numbers.map(number => number * 2);
```

In the example above, the expression `number * 2` is automatically returned because it comes directly after the `=>` arrow (instead of coming after curly braces). This is called an `implicit return`.

### Chaining

Notice how we were able to write one method after another e.g. `names.map(formatName).forEach(log)`? This is called _method chaining_.

You can call `.forEach()` after `.map()` because `.map()` returns a new array.

Consider this code:

```js
var namesFormatted = names.map(format);
namesFormatted.forEach(log);
```

It can be written more simply (without assigning the array returned from `.map()` to a variable):

```js
names.map(format).forEach(log);
```

Be careful though! You can not call `.map()` after `.forEach`.

```js
names.forEach(log).map(formatName); // ERROR
```

This code does not work because `forEach()` does not return a new array (it returns `undefined`). The code is, therefore, attempting to call `.map()` on `undefined`, and `undefined` does not have a `.map()` method.

{% include "./homework.md" %}
