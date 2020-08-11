# Homework

1. From the [Javascript/Core Module 1 repository](https://github.com/Migracode-Barcelona/exercises-js1) review and finish all exercises in the folder `week-2/InClass`
2. Go to [The Modern JavaScript Tutorial](https://javascript.info) and widen your knowledge on [2.12 Loops: while and for](https://javascript.info/while-for)
3. Complete all of the exercises in the folder `week-2/Homework`
4. [Push](/others/git.html#commit-and-push-your-changes-to-github) the changes to your repository in Github
5. Complete the [Homework Form](https://form.jotformeu.com/93377027809365), to notify mentors and add comments and questions about the exercises

# Practice Day (Saturday)

## Playing computer I

1. You have to predict the output of this program without executing it.
2. What is printed to the console?

```js
const daysOfWeek = [
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday",
  "Saturday",
  "Sunday",
];

function workingDay(day) {
  return day + " is a working day";
}

function weekendDay(day) {
  return day + " is at the weekend!";
}

for (let i = 0; i < daysOfWeek.length; i++) {
  if (i < 5) {
    let day = workingDay(daysOfWeek[i]);
    console.log(day);
  } else {
    let day = weekendDay(daysOfWeek[i]);
    console.log(day);
  }
}
```

## Playing computer II

1. You have to predict the output of this program without executing it.
2. What is printed to the console?

```js
const a = 4;
const b = 8;

const multiplyNumbers = function (a, b) {
  return a * b;
};

const addNumbers = function (a, b, c) {
  return a + b + c;
};

for (let i = 0; i < 5; ++i) {
  if (i < 3) {
    const day = addNumbers(i, 2, a);
    console.log(day);
  } else {
    const day = multiplyNumbers(i, 4);
    console.log(day);
  }
}
```

## Playing computer III

1. Again, you have to predict the output of this program without executing it.
2. What is printed to the console?
3. What was difficult about this exercise?

```js
let x = 2;
let y = 4;
let a = 2;
let b = 20;

const f1 = function (a, b) {
  return a * b;
};

const f2 = function (a, b, c) {
  return a + b + c;
};

console.log(x);
x = 3;
y = f1(x, 2);
console.log(y);

for (let i = 0; i < 10; ++i) {
  a = a + 1;
  if (i % 2 === 0) {
    const d = f2(i, y, a);
    console.log(d);
  } else {
    const e = f1(i, 2);
    console.log(e);
  }
}
```

1. Go to [CodeWars](https://codewars.com) and solve as many katas as you can:
    1. [Reversed Strings](https://www.codewars.com/kata/reversed-strings/javascript)
    1. [Remove First and Last Character](https://www.codewars.com/kata/56bc28ad5bdaeb48760009b0)
    1. [Stats: Sum of positive](https://www.codewars.com/kata/5715eaedb436cf5606000381)
    1. [Find the smallest integer in the array](https://www.codewars.com/kata/find-the-smallest-integer-in-the-array/javascript)
    1. [Counting sheep…](https://www.codewars.com/kata/counting-sheep-dot-dot-dot/javascript)
    1. [Grasshopper - Summation](https://www.codewars.com/kata/grasshopper-summation/javascript)
    1. [Stats: Square(n) Sum](https://www.codewars.com/kata/515e271a311df0350d00000f)
    1. [Invert values](https://www.codewars.com/kata/invert-values/train/javascript)
    1. [A Needle in the Haystack](https://www.codewars.com/kata/56676e8fabd2d1ff3000000c/javascript)
    1. [Sum of positive](https://www.codewars.com/kata/sum-of-positive/train/javascript)
    1. [Sum without highest and lowest number](https://www.codewars.com/kata/sum-without-highest-and-lowest-number/train/javascript)
    1. [Count of positives / sum of negatives](https://www.codewars.com/kata/count-of-positives-slash-sum-of-negatives/train/javascript)
