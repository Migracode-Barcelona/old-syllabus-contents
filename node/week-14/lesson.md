![](https://img.shields.io/badge/status-review-orange.svg)

# Node - Week 2

---

**Teaching this lesson?**

Read the Mentors Notes [here](./mentors.md)

---

## Contents

- [HTTP](#HTTP)
- [APIs](#apis)
- [Workshop](#workshop)

---



# HTTP

> It is a protocol that browser and the server uses to talk to each other

![HTTP](../assets/http_diagram.png)


Respond with Hello World! on the homepage:

```js
app.get('/', function (req, res) {
  res.send('Hello World!')
})
```

Respond to POST request on the root route (/), the application’s home page:

```js
app.post('/', function (req, res) {
  res.send('Got a POST request')
})
```

Respond to a PUT request to the /user route:

```js
app.put('/user', function (req, res) {
  res.send('Got a PUT request at /user')
})
```

Respond to a DELETE request to the /user route:

```js
app.delete('/user', function (req, res) {
  res.send('Got a DELETE request at /user')
})
```

Read more on Mozilla's
[An overview of HTTP](https://developer.mozilla.org/en-US/docs/Web/HTTP/Overview)
[HTTP messages](https://developer.mozilla.org/en-US/docs/Web/HTTP/Overview#HTTP_Messages)


# APIs

APIs (Application Programming Interfaces) provide a way for applications to
communicate with each other. We already consumed an API earlier in the day:
**Github API**. We managed to _communicate_ with Github and get important
information. We - the client - can use this information in a number of different
ways. Our client, in this case, is a Web page but it could have easily been a
Mobile Application, or a TV setbox etc...

> **Let's** watch this video about APIs -
> [What is an API](https://www.youtube.com/watch?v=s7wmiS2mSXY)

> **Exercise**: Let's expose the `posts.json` as an API for other clients to
> consume through the url `/api/get-posts`. Hint: make use `res.sendFile`

## REST API

[REST](https://en.wikipedia.org/wiki/Representational_state_transfer) (REpresentational State Transfer) and RESTful APIs provide a convention and architecture for building APIs that is simple and scalable.

There are many constraints and aspects to building a REST API, but one
fundamental constraint is the use of a URL (Uniform Resource Locator) and HTTP
Methods (GET, POST, PUT, DELETE etc..)

In our _endpoint_ that we just created `/api/get-posts`, the _get_ part of the
URL is redundant as the HTTP Method `GET` already tells that we are _GETting_ a
_Resource_. The Resource in this case is called **posts**.

> Exercise: Let's rename our endpoint to `/posts` so that it follows RESTful
> architecture.
>
> **What would the endpoint for creating posts be called?**

> **Watch**: [What is a REST API](https://www.youtube.com/watch?v=7YcW25PHnAA)
> (up to 3 minutes)

REST is a big topic that we will revisit again. The table below from Wikipedia
shows how a typical RESTful API would look like.

![](../assets/REST.png)
[Wikipedia](https://en.wikipedia.org/wiki/Representational_state_transfer#Uniform_interface)

For now, remember when building APIs, to use **Resource** names to identify your
endpoints and make use of the **HTTP methods (Verbs)** to describe operations
performed on those resources.

# Postman API Client


Postman is a platform for API development. We can use the API Client to check and test our API, simplifying each step of building.

https://www.postman.com/product/api-client/

Add postman as a Chrome extension

# Workshop - Post


### Step 1: Create a node project

### Step 2: 

All requests use one of the `HTTP methods`. The main ones are: `GET, POST, PUT, DELETE`.

`app.get` deals with requests that use the `GET` HTTP method.

> We will go into these Methods into more details, but for now, think of `GET`
> as a method for Getting data. `POST` is for POSTing/inserting new data. `PUT`
> is for updating. `DELETE` is for deleting data.

### The `POST` http request method

When sending data to the server, we use the `POST` http request method, instead
of `GET`.

Let's try `POST`ing some text to the server.

We're going to add a form to the `index.html` page, so that you can write your
blogposts from there.

Open up the `index.html` file in your text editor. If you have a look, you
should see this:

```html
<div class="entry-container">
  <!--PASTE YOUR CODE HERE!! -->
</div>
```

**Replace the greyed-out comment with this code snippet:**

```html
<h3>Create a blog post</h3>
<form action="/create-post" method="POST">
  <textarea name="blogpost" rows="10" cols="14"></textarea>
  <button type="submit">Send</button>
</form>
```

- This form has a text area and a Send button.
- The `action` attribute is the endpoint form data will be sent to.
- The `name` attribute will be used later to reference the data.

When you hit Send, the form will send a `POST` request to the server, using
whatever is in the `action` attribute as the endpoint. In our case it's
`/create-post`.

> **Exercise:** Open Chrome Developers tool, click the button and see what
> happens.

### Receiving the blog post on the server

- Data doesn't come through the server in one go; it flows to the server in a
  **stream**. Think of a stream as water flowing from a tap into a bucket. Your
  job is to collect this water in the server.

- If we were writing a pure Node server, we would have to think about how to
  collect the stream of data properly. But luckily for us, Express handles all
  of that stuff under the hood.

- All you need to do is define a route to deal with requests that come through
  on the `/create-post` endpoint.

Let's remind ourselves of a simple `GET` route in Express:

```js
app.get("/hello-world", function (req, res) {
  res.send("Hello there!");
});
```

> **Exercise:** This time we want to define a route to deal with a `POST`
> request not a `GET`. What do you think you would need to do differently?
> Experiment and see if you can define a route for the `/create-post` endpoint!
>
> For now, make your `/create-post` handler simply do this: `console.log('I am /create-post endpoint')`.

---

### Extracting the blog post

Now the contents of your blogpost is hidden in your `req` object somewhere.
Normally you would extract it using `req.body`. Try to console.log `req.body`
now.

Getting `undefined`? Not to worry, that's normal. When data has been `POST`ed to
the server as `FormData`, we need to do things slightly differently to access
the data that's come through in the request.

We need another middleware function. Something that can get extract the contents
out of the special `FormData` object. For this we will use `express-formidable`.
`express-formidable` is another Express middleware. It will extract the form
data from the request and make it available to you when you do `req.fields`.

This time though, `express-formidable` is not built-in, we need to explicitly
install it.

**In your terminal, install express-formidable**

```bash
npm install express-formidable --save
```

`require` `express-formidable` so you can use it in your code. You can't use
dashes in JavaScript variable names, so just call it `const formidable`.

```js
const formidable = require("express-formidable");
```

Now add this towards the top of your server, after your `require`s and
`app.use(express.static('public'))`, but before your `/create-post` endpoint:

```js
app.use(formidable());
```

Now inside your `/create-post` function, add:

```js
console.log(req.fields);
```

Refresh your server and have another go at writing a blogpost.

You should now see an object in the console. The key should be `blogpost`, just
like the name attribute in the form on the HTML page. The value of `blogpost`
will be your message!

> **Exercise**: Try putting `app.use(formidable());` at the end of the file
> (after the `create-post` but before starting the server)

> **What is a middleware in Express?** Middleware functions are functions that
> have access to the request object (req), the response object (res), and the
> next function in the application’s request-response cycle. The next function
> is a function in the Express router which, when invoked, executes the
> middleware succeeding the current middleware. Read more on
> [the Express documentation](https://expressjs.com/en/guide/writing-middleware.html)

### Step 8 - Saving your blog post

Right now, your precious blog posts aren't being saved anywhere, which is a bit
of a shame. Let's do something about that.

You'll note that in the data folder there's a new file called `posts.json`.

If you look at `posts.json` will see there's already one blog post there. The
format is:

```js
{
    [timestamp]: [blog post message]
}
```

We've used a timestamp as the key so that the blog posts are listed in
chronological order. Also, it's a record of when the blog post was created.

### Writing to your hard drive

Anytime a blog post comes through to the server, we want to save the data on
your computer's hard drive. To do this, we need to use a built-in Node module:
`fs`, which stands for 'file-system'.

Built-in Node modules - **core Node modules** - are rather like the built-in
Express middleware functions. Only difference is that where you need to have
installed Express to use Express middleware functions, the core Node modules
come automatically with Node itself.

To use `fs`, you'll need to require it at the top of your server file:

```js
const fs = require("fs");
```

The method we need to write to your hard drive is `fs.writeFile`.

```js
fs.writeFile("path/to/file", yourData, function (error) {
  // do something
});
```

- Argument 1: the location of the file you want to write to
- Argument 2: the data you want to write
- Argument 3: the callback function

The 'path/to/file' will be replaced with the actual path to the file you want to
write to. If it doesn't exist, `fs.writeFile` cleverly creates one for you. But
we already have `posts.json`, so not to worry.

### Reading from your hard drive

To read data that's already there, you would use `fs.readFile`. The way to use
`fs.readFile` is very similar to `fs.writeFile`:

```js
fs.readFile("path/to/file", function (error, file) {
  // do something
});
```

- Argument 1: the location of the file you want to read from
- Argument 2: the callback function

You'll notice that `fs.readFile`'s callback function takes a second argument.
That argument would be the file you're reading.

Let's read the data from the `posts.json` file. Make sure you've `require`d the
`fs` core Node module at the top of your server file somewhere.

Add this code to your server (put it anywhere after the `require`s for now):

```js
fs.readFile(__dirname + "/data/posts.json", function (error, file) {
  console.log(file);
});
```

(`__dirname` is a Node global object that gives you a path to current working
directory. It's handy if we want to avoid writing the whole path out in full.)

If you restart the server, you'll probably see something like this:

```bash
<Buffer 7b 0a 20 20 20 20 22 31 34 36 37 33 39 30 33 35 36 32 39 31 22 3a 20 22 54 68 69 73 20 69 73 20 6d 79 20 76 65 72 79 20 66 69 72 73 74 20 62 6c 6f 67 ... >
```

This is actually the contents of your `posts.json` file, but in a format called
a **buffer**. To make it a bit more human-readable, you can console.log the file
to a string, like this:

```js
console.log(file.toString());
```

`file` is in JSON format right now. If we want to access the blog post message
inside `file`, we need to parse it from JSON back to a JavaScipt object.

Add this next bit of code to your `fs.readFile`'s callback function:

```js
const parsedFile = JSON.parse(file);
```

Now `parsedFile` is a normal JavaScript object, and we can access the data
inside it.

Ok, so we've talked about JSON and we've talked about reading and writing files.
You now have the power to save new blog post data to your hard drive! Work with
your partner and your mentor to see if you can figure the next steps out on your
own.

Here's a breakdown of what you want to achieve:

- When new blog post data comes through, read from `posts.json` to access its
  contents
- Add your new blog post data to the old ones.
- Write your new combined data back to the `posts.json` file.

### Things to remember

- `fs.writeFile()` normally overwrites the target file you've given it. Chances
  are you don't want to lose all your old blog posts every time you get a new
  one, so think about how you can combine `fs.readFile()` and `fs.writeFile()`
  to prevent overwriting.

- You will need to convert between JSON and a JavaScript object several times.
  `JSON.parse()` and `JSON.stringify()` are what you need.

Oh by the way, if you want to get the current timestamp, use the JavaScript
`Date.now()` method.

### Step 9 - Displaying your blog posts

So now we're saving the blog posts to the server. Time to get them and display
them on the page!

If you look inside `public/script.js`, there's a whole bunch of JavaScript code
in there. Don't worry about what all the code means, just know that it's
responsible for sending a request to GET old blog posts and display them on the
page underneath "Recent Posts".

`script.js` is trying to load existing posts by making a GET request. Look
inside `script.js` and see if you can find any useful endpoints.

Your `script.js` file will want to receive the JSON containing your blog posts.
Your job is to make that happen!

Express has a handy method called `res.sendFile()` that makes it easy to send
files back to the client. Feel free to use this with your JSON.

If all goes well, you should have a fully functional CMS!



{% include "./homework.md" %}
{% include "../../others/escalation-policy.md" %}
