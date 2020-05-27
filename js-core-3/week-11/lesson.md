![](https://img.shields.io/badge/status-draft-darkred.svg)

# JS Core III - 2

**What we will learn today?**

What is Testing, Unit Testing and TDD, and when and why use them.

**Before the class**

> 1. Clone the [js-exercises-tdd repo](https://github.com/CodeYourFuture/js-exercises-tdd)
> 2. Install Jest, using the command npm install --save-dev jest


** What we will learn today?**

* [Testing](#testing-our-code)
* [Unit Testing](#unit-testing)
* [Unit Testing Frameworks - JEST](#jest)
* [Test-driven Development](#test-driven-development)


---


## Testing our code

We have just traced the output of some code on paper, but how do ensure that the code actually does what it is supposed to do when we run it.

In many organisations, there are full teams dedicated to **testing** and ensuring that the code written behaves correctly, to report **bugs** and make sure that they are fixed on time. In general, **Quality Assurance** is a responsibility of everyone in a team starting from Project Manager, Scrum Masters, Developers and Testers.

There are typically several levels of testing when working on a project:

- Unit testing
- Integration testing
- Functional, End to End testing and User Acceptance Testing (UAT)

[This answer from Stack OverFlow](https://stackoverflow.com/a/4904533) has a good explanation of types of testing.

*Unit testing* though is always the responsibility of the Developer, and it is a very important skill for any professional developer to be able to write tests, and also write code that is testable.

> Discussion: What is testable code?

```js
var result;

function getMentorInfo(mentors, name) {
    var greeting = 'Hello ';

    result = mentors.find(function (person) {
        return person.name === name;
    });

    var mentorTitle = 'Junior Developer';

    if (result.yearsOfExp > 10) {
        mentorTitle = 'Senior Developer';
    } else if (result.yearsOfExp > 20) {
        mentorTitle = 'Very Senior Developer';
    }

    result.jobTitle = mentorTitle;
    result.fullName = result.title + ' ' + result.name;

    return result;
}

/*
  var mentors = [
      {
          name: 'Irina',
          title: 'Dr.',
          yearsOfExperience: 10
      }, {
          name: 'Ashleigh',
          title: 'Dame',
          yearsOfExperience: 20
      }, {
          name: 'Etza',
          title: 'Professor',
          yearsOfExperience: 30
      }
  ];
  
  var result = getMentorInfo(mentors, 'Etza')
  Trace the value of "result"
*/
```

## Unit Testing

Testing is a key skill for any software programmer. We need to make sure our
software is thoroughly tested, otherwise bad things happen. Testing makes sure
our programs behave like we intend them to do - **if we don't test, we can cause
severe bugs**. Bad software can make planes crash, companies bankrupt, and users
of your software really frustrated.

There are different levels on which we can test software, for example
integration testing, end-to-end testing, and unit testing. Today we will deal
with unit testing, which is probably the most universal testing discipline.

A unit test is exactly that - it tests a _unit_ of code. "Unit" can mean
different things, but in JavaScript it usually refers to a single function.

Remember when we talked about functions? Functions take _input_ (as arguments),
do something with it (in the function body), and return _output_ (using the
`return` statement). Ideally, a function should always return the same output if
the same input is given. It makes it predictable and testable - and that's what
we want!

```
         |-----------------|
input => | doing something | => output
         |-----------------|
```

So, when unit testing a function, we want to make sure that _for a certain
input, we get the expected output_. For this we need to make sure that the
output matches our expectations. In the simplest form that means we do an
equality check:

```js
myFunction(input) === expectedOutput;
```


### Unit testing frameworks

There are lots of other things you might want to test for than two things being
equal. You might want to test if a number is smaller or greater than another, if
a function was called, if an error happened, or if one thing happened before
another thing, or how long a function call took to execute.

We don't have to build all these things ourselves. Instead there are _unit
testing frameworks_ that take all that work off our shoulders. All we need to do
is provide the code and the tests.

### Jest

The unit testing framework we are trying to day is called
[Jest](https://facebook.github.io/jest/). It's created by Facebook and useful
for all kinds of unit testing (especially testing React, which we will do in a
later lesson).

The suffix `.test.js` tells Jest that this file contains tests it should execute. To
execute the test, run the following command in your terminal:

```sh
npm test sum.test.js
```

This command runs the test in `sum.test.js`, which tests the `sum()` function.
You can see the test output and the fact that the test passed.

Tests cases in Jest have the following structure:

```js
test("test description", function() {
  // Test instructions
});
```

Jest provides a set of functions that you can use to write your actual tests.
They are created in a way that imitates natural language, for example:

```
_Expect_ sum of 1 and 2 _to be_ 3
```

becomes

```js
expect(sum(1, 2)).toBe(3);
```

You can add multiple test statements in the same test case (a test case is one
call of the `test` function, but you can also create multiple test cases in one
file. It is important that you give all your test cases meaningful descriptions.

Read some information about [Jest](https://jestjs.io/docs/en/getting-started)

> _Exercise:_ From the repo do some exercises in the folder I.pass-test, like in the [CodeWars katas](https://www.codewars.com/kata/5168bb5dfe9a00b126000018/train/javascript), you have to write to code to pass the test


> _Exercise:_ From the repo try to write some tests in the folder II.write-tests, to test the functions are already implemented

## Test Driven Development

Test-driven development (TDD) is a software development process that relies on the repetition of a very short development cycle: requirements are turned into very specific test cases, then the software is improved to pass the new tests, only. This is opposed to software development that allows software to be added that is not proven to meet requirements. [Wikipedia]

When developing following TDD, you normally follow this sequence:

1. Add a test
2. Run all tests and see if the new test fails (Red)
3. Write the simplest code to make the test pass (Green)
4. Refactor
5. Repeat


Read more on the [Wikipedia article](https://en.wikipedia.org/wiki/Test-driven_development) and the resources at the end.

> _Exercise:_ From the repo try do just the exercise III.tdd-katas/fizz-buzz/


{% include "./homework.md" %}
