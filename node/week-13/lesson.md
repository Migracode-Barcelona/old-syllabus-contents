![](https://img.shields.io/badge/status-review-orange.svg)

# Node - Week 1

---

**Teaching this lesson?**

Read the Mentors Notes [here](./mentors.md)

---

## Contents

- [What is a server?](#what-is-a-server)
- [Node and its ecosystem](#node-and-its-ecosystem)
- [Express](#express)
- [Routing](#Routing)
- [Workshop](#workshop)

---

## What is a server?

Servers are computer programs that receive requests from other programs, the
_clients_ and send back a response e.g share data, information or hardware and
software resources.

### ...and what is a server in plain English?

A server is a computer program. Its job is to send and receive data.

Let's take a website for example. A website is just a collection of HTML and CSS
files, images, maybe some javascript files. When you type a website address in
your browser's address bar, the browser (client) sends a **request** to the
server that lives at that address. The browser asks the server to give it the
files it needs to display the website properly.

![Server flow](https://files.gitter.im/heron2014/FiiK/server.png)

## Node and its ecosystem

> [Node.js®](https://nodejs.org/en/) is a **JavaScript runtime** built on
> Chrome's **V8 JavaScript engine**. Node.js uses an **event-driven**,
> **non-blocking** I/O model that makes it lightweight and efficient.

## What is it used for?

- web servers, so creating dynamic websites
- set up a local web development environment
- easier to build desktop applications with Electron: Slack, Visual Code, Atom
- some of the biggest companies use Node.js in production: Netflix, Walmart,
  IBM, etc.
- JavaScript everywhere (used to be PHP, Python, JavaScript, MySQL, Apache, now
  JavaScript full stack)

## Express

[Express](http://expressjs.com/) is one of the most widely-used frameworks for
Node.js. It simplifies base features of Node.js, making it easier and faster to
build your application's backend. Learning Express gives you a great foundation
for becoming a Node.js developer.

In the next steps, we will building a **CMS (Content Management System)** - a
system to write, publish and save blog posts. Even though we could use core
libraries like `http` to build this system, this becomes very complicated and
non-maintainable very quickly. That is why we use frameworks like `Express`.

## A simple Node.js server

### Hello world example

```js
const express = require('express')
const app = express()
const port = 3000

app.get('/', (req, res) => res.send('Hello World!'))

app.listen(port, () => console.log(`Example app listening at http://localhost:${port}`))
```

This app starts a server and listens on port 3000 for connections. The app responds with “Hello World!” for requests to the root URL (/) or route. For every other path, it will respond with a 404 Not Found.

The example above is actually a working server: Go ahead and click on the URL shown. You’ll get a response, with real-time logs on the page, and any changes you make will be reflected in real time. This is powered by RunKit, which provides an interactive JavaScript playground connected to a complete Node environment that runs in your web browser. Below are instructions for running the same app on your local machine.

  > Exercise: Running Locally 

First create a directory named myapp, change to it and run npm init. Then install express as a dependency, as per the [installation guide](https://expressjs.com/en/starter/installing.html).

In the myapp directory, create a file named app.js and copy in the code from the example above.

Run the app with the following command:

```js
$ node app.js
```

Then, load http://localhost:3000/ in a browser to see the output.

## Routing 

Routing refers to determining how an application responds to a client request to a particular endpoint, which is a URI (or path) and a specific HTTP request method (GET, POST, and so on).

Each route can have one or more handler functions, which are executed when the route is matched.

```js
const express = require('express')
const app = express()
const port = 3000

app.get('/', (req, res) => res.send('Hello world!'))
app.get('/students', (req, res) => res.send('Hello students!'))

app.listen(port, () => console.log(`Example app listening at http://localhost:${port}`))
```

> Exercise: 
> How would you add another route `/mentors`?

Route definition takes the following structure:

```js
app.METHOD(PATH, HANDLER)
```

Where:

- app is an instance of express.
- METHOD is an HTTP request method, in lowercase.
- PATH is a path on the server.
- HANDLER is the function executed when the route is matched.

The following examples illustrate defining simple routes.

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




### HTTP

> It is a protocol that browser and the server uses to talk to each other

![HTTP](../assets/http_diagram.png)

Read more on Mozilla's
[An overview of HTTP](https://developer.mozilla.org/en-US/docs/Web/HTTP/Overview)
[HTTP messages](https://developer.mozilla.org/en-US/docs/Web/HTTP/Overview#HTTP_Messages)



## Workshop

Buckle up and start the [express workshop](./workshop.html).

## Group Research Topics

- Security: (https, same origin, cookies, xss etc..)
- Performance: Request lifecycle (from browser to server and back), Performance
  considerations and optimisations
- HTTP and REST: (headers, status codes, Cookies, REST)
- Node internals: Node event loop, Node core modules, async/sync (non-blocking
  operations)

The research will be on a Github repo. One member of the group will be
responsible of creating a repo, the others will fork it and create Pull Requests
for it (that the main repo's owner will have to review and merge).

**We expect each repo to have commits from each member of the group**

## Resources

Take a look at the following links to learn more about Node.js.

- Read: [The art of node](https://github.com/maxogden/art-of-node/#the-art-of-node)
- Read: [Node Resources](https://node.cool#resources)

More about HTTP:
[Tutsplus tutorial](https://code.tutsplus.com/tutorials/http-headers-for-dummies--net-8039)

More about JSON:

- https://en.wikipedia.org/wiki/JSON
- https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Global_Objects/JSON/parse
- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/stringify

Heroku:

- [Deploying from Git](https://devcenter.heroku.com/articles/git)
- [Deploying Node Apps](https://devcenter.heroku.com/articles/getting-started-with-nodejs#set-up)

{% include "./homework.md" %}
{% include "../../others/escalation-policy.md" %}
