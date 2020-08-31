# JavaScript Core II - 2

## Before the class

> 1. Open in Visual Studio the repo the repository you forked last week
> 2. Go to the folder _week-2/InClass/A-myfirstscript_
> 3. Execute your first Website with javascript by using [vscode-live-server](https://github.com/ritwickdey/vscode-live-server)
>    - Install the plugin by: In VSCode type ctrl+P, then type ext install ritwickdey.liveserver.
>    - Right click on `index.html` and select "Open with Live Server"
>    - or just open the `index.html` on your browser and refresh every time you change your code

## Learning objectives

After long days working on a black screen, with the only output of `console.log`...But JavaScript was not meant to be run in `console.log`: it was meant to make web pages dynamic.
Lots of websites are powered by JavaScript today, and some (like Facebook) cannot function at all without it: it's become that important to the look and feel of the website.

Today we will learn how to combine all this javascript knowledge with HTML and CSS in a browser, changing elements dynamically from user actions.

By the end of this lesson students should be able to:

- Define what the DOM is and what it does
- Use query selectors to retrieve elements from the DOM
- Use event listeners to respond to events that happen on the DOM
- Create DOM elements using JavaScript and add them to the DOM
- Manipulate DOM elements using JavaScript to change their properties

## Content

  - [The DOM](#the-dom)
  - [Access DOM elements](#access-dom-elements)
  - [Attach events to DOM elements](#attach-events-to-dom-elements)
  - [Create DOM elements](#create-dom-elements)
  - [Manipulate DOM elements](#manipulate-dom-elements)

### The DOM

Your webpages are made up of a bunch of HTML elements, nested within each other (parents and children). But JavaScript doesn't know about any of that.

Thankfully, in JavaScript we have access to this "DOM" object (Document Object Model) which is actually a representation of our webpage that JavaScript can work with.

Here are two examples, HTML and then JavaScript, of how the DOM might look like:

```html
<html>
  <body>
    <h1>Welcome!</h1>
    <p>Hello world!</p>
  </body>
</html>
```

```js
let document = {
  body: {
    h1: "Welcome",
    p: "Hello world!",
  },
};
```

This is how we would represent the document hierarchy above as a tree of nodes:

![](tree.png)

But how can we combine HTML and Javascript? The `<script>` tag allows us to include a piece of JavaScript in a HTML document.

```js
<h1>Testing alert</h1>
<script>alert("hello!");</script>
```

Such a script will run as soon as its `<script>` tag is encountered while the browser reads the HTML. This page will pop up a dialog when opened—the alert function resembles prompt, in that it pops up a little window, only shows a message.

Including large programs directly in HTML documents is often impractical. The `<script>` tag can be given an _src_ attribute to fetch a script file (a text file containing a JavaScript program) from a URL.

```js
<h1>Testing alert</h1>
<script src="myfirstscript.js"></script>
```

The myfirstscript.js file includes a line with the `alert("hello!");`, and the result is exactly the same.

#### Exercise A-1 (5 min)

1. Look the files `index.html` and `myfirstscript.js` in the folder `week-2/InClass/A-myfirstscript`
2. Execute the Visual Studio Live Server as explained at the beginning of this lesson
3. See how the alert appears 
4. Right a name in the input and click the button, right know you don't have to understand the code, but, what do you think the code is doing?

### Access DOM elements

The DOM offers a lot of useful functions we can use to find elements on the page. Here are some we'll be using today:

```js
document.querySelector("#mainHeader");
document.querySelectorAll("p");
```

Both `.querySelector` and `querySelectorAll` accept a CSS selector as an input.
`.querySelector` selects only the first element it finds, `querySelectorAll` selects all elements (it returns a `NodeList`, which you can think of as being similar to an array; it is an ordered sequence of DOM elements which you can loop through like with an array. The difference is that many common array methods like `.map` or `.concat` can't be used on a `NodeList`. To turn a `NodeList` into an array, you can use `Array.from`, e.g. `let elementArray = Array.from(document.querySelectorAll("div"));`).

#### Exercise B-1 (10 min)

1. Go to the folder `week-2/InClass/B-dom-manipulation`
2. Complete the Task 1 explained in the file `exercise.js`

### Attach events to DOM elements

Once you retrieve an element using `.querySelector`, you can attach an **event** to it. An event is any action that can be performed on that element. For now, we will just use the **click** event:

```js
let myButton = document.querySelector("#myButton");
myButton.addEventListener("click", alertSomething);

function alertSomething() {
  alert("Something");
}
```

You will notice in the example that we passed a second argument to `addEventListener`. That second argument is the **function** that we want to invoke when that event has happened.

#### Exercise B-2 (10 min)

1. Go to the folder `week-2/InClass/B-dom-manipulation`
2. Complete the Task 2 explained in the file `exercise.js`

The elements returned by `document.querySelector` have the same properties as a normal HTML element: for example, you can get access to their css **styles**.

```js
let myElement = document.querySelector("#myElement");
myElement.style.backgroundColor = "red";
```

#### Exercise B-3 (10 min)

1. Go to the folder `week-2/InClass/B-dom-manipulation`
2. Complete the Task 3 explained in the file `exercise.js`

### Create DOM elements

Using the `document`, you can also create new elements. These elements will not appear until you append them as a child of another element though:

```js
let paragraph = document.createElement("p"); // here we're just creating it, element is not visible yet
myElement.appendChild(paragraph); // now the element is added to our view, but it's empty
```

`document.createElement` accepts as an input any element type. So for example `document.createElement("article")` will create a new article element.

#### Exercise B-4 (10 min)

1. Go to the folder `week-2/InClass/B-dom-manipulation`
2. Complete the Task 4 explained in the file `exercise.js`

### Manipulate DOM elements

You can then change the text displayed inside elements using the `innerText` property:

```js
paragraph.innerText = "How are you?"; // now we can see the text displaying on the screen
```

We've been using `document.querySelector` to retrieve a single element.
To retrieve a list of multiple elements (that match a specific class name for example, or a specific tag) we use `document.querySelectorAll`.

```js
//change the background of all the paragraph items on our page
let paragraphs = document.querySelectorAll("p");
for (let i = 0; i < paragraphs.length; i++) {
  paragraphs[i].style.backgroundColor = "blue";
}
```

We've learned that `style` and `innerText` are properties of DOM elements. Image tags can also have `width` and `height`.

While it's really easy to change styles directly on elements using the `style` property, it is not usually a good idea to mix JavaScript and CSS (see separation of concerns in the first lesson). To solve this, we can use the `className` property to set the class for an element instead of changing its styles directly:

```js
//before: <div id="myContainer"></div>
let container = document.querySelector("#myContainer");
container.className = "largeBlock";
//after: <div id="myContainer" class="largeBlock"></div>
```

To get the text from an Input field:

```js
let updateTitleBtn = document.querySelector("#updateTitleBtn");

updateTitleBtn.addEventListener("click", function () {
  let inputBox = document.querySelector("#titleInput");
  let title = inputBox.value;

  let titleElement = document.querySelector("#lessonTitle");
  titleElement.innerText = title;
  inputBox.value = title;
});
```

The above waits for click on a button. When the button is clicked, it gets the input box element (`inputBox` variable).
To get the entered text from it, we use the `value` property: `let title = inputBox.value`.

#### Exercise B-5 (10 min)

1. Go to the folder `week-2/InClass/B-dom-manipulation`
2. Complete the Task 5 explained in the file `exercise.js`

#### Exercise B-6 (10 min)

1. Go to the folder `week-2/InClass/B-dom-manipulation`
2. Complete the Task 6 explained in the file `exercise.js`

#### Exercise B-7 (10 min)

1. Go to the folder `week-2/InClass/B-dom-manipulation`
2. Complete the Task 7 explained in the file `exercise.js`

{% include "./homework.md" %}
