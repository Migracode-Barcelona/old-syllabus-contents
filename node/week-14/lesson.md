![](https://img.shields.io/badge/status-review-orange.svg)

# Node - Week 2

---

**Teaching this lesson?**

Read the Mentors Notes [here](./mentors.md)

---

## Contents

- [HTTP](#HTTP)
- [APIs](#apis)
- [CORS](#Postman API Client)
- [Postman](#Postman API Client)
- [Read POST and PUT](#Read POST and PUT)
- [Nodemon](#Nodemon)
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

Read more on Mozilla's:
- [An overview of HTTP](https://developer.mozilla.org/en-US/docs/Web/HTTP/Overview)
- [HTTP messages](https://developer.mozilla.org/en-US/docs/Web/HTTP/Overview#HTTP_Messages)


# APIs

APIs (Application Programming Interfaces) provide a way for applications to
communicate with each other. We already consumed an API earlier in the day:
**Github API**. We managed to _communicate_ with Github and get important
information. We - the client - can use this information in a number of different
ways. Our client, in this case, is a Web page but it could have easily been a
Mobile Application, or a TV setbox etc...

> **Let's** watch this video about APIs -
> [What is an API](https://www.youtube.com/watch?v=s7wmiS2mSXY)

## REST API

[REST](https://en.wikipedia.org/wiki/Representational_state_transfer) (REpresentational State Transfer) and RESTful APIs provide a convention and architecture for building APIs that is simple and scalable.

There are many constraints and aspects to building a REST API, but one
fundamental constraint is the use of a URL (Uniform Resource Locator) and HTTP
Methods (GET, POST, PUT, DELETE etc..)

In our _endpoint_ that we just created `/api/get-posts`, the _get_ part of the
URL is redundant as the HTTP Method `GET` already tells that we are _GETting_ a
_Resource_. The Resource in this case is called **posts**.

> **Watch**: [What is a REST API](https://www.youtube.com/watch?v=7YcW25PHnAA)
> (up to 3 minutes)
>
> Analyze the [TypeForm REST API](https://developer.typeform.com/create/reference/create-form/)

REST is a big topic that we will revisit again. The table below from Wikipedia
shows how a typical RESTful API would look like.

![](../assets/REST.png)
[Wikipedia](https://en.wikipedia.org/wiki/Representational_state_transfer#Uniform_interface)

For now, remember when building APIs, to use **Resource** names to identify your
endpoints and make use of the **HTTP methods (Verbs)** to describe operations
performed on those resources.


# CORS

Cross-origin resource sharing (CORS) is a mechanism that allows restricted resources on a web page to be requested from another domain outside the domain from which the first resource was served. More info in [Wiki](https://en.wikipedia.org/wiki/Cross-origin_resource_sharing)

Certain "cross-domain" requests, are forbidden by default by the same-origin security policy. CORS defines a way in which a browser and server can interact to determine whether it is safe to allow the cross-origin request.

Express has a package to manage CORS, available through npm. 

Find in this [link](https://expressjs.com/en/resources/middleware/cors.html) information to install and use it in your server.


# Postman API Client

Postman is a platform for API development. We can use the API Client to check and test our API, simplifying each step of building.

https://www.postman.com/product/api-client/

Add postman as a Chrome extension.

When we use the methods POST and PUT, how do we read them from the server?

# Read POST and PUT

The contents of POST and PUT are hidden in the req object. You need to use express-formidable to be able to read them.
Go to your terminal and install express-formidable:

```js
$ npm install express-formidable --save
```

Next, you need to require the express-formidable library so you can use it in your code.

```js
var formidable = require('express-formidable');
```

After the server requires, add the instruction to use the module:

```js
app.use(formidable());
```

Then, check in your server how are you able to read what the client sent:

```js
app.post('/', function (req, res) {
  console.log(req.fields);
  res.send('Got a POST request')
})
```

# Nodemon

It is a bit annoying that we have to kill and restart our server every time we want to test our changes. There is a handy npm package that can help us with that task.

```js
$ npm install --save-dev nodemon
```

Make sure the package is added to your package.json, add this line to the script:

```js
scripts: {
  start: "node server.js",
  dev: 'nodemon server.js'
}
```

now from your terminal, use the command npm run dev and that will run the server with nodemon which is a package that makes the server listen to code changes and automatically restart.


# Exercise: CRUD

So what will we build? we will build a CRUD API. CRUD stands for Create, Retrieve, Update, Delete. If you think about it, this is what most applications do:

- Create some "resources"
- Retrieve them (GET them)
- Update them
- Delete them

Taking the exercise from the last week:

1. Add an endpoint to the API server to allow GETting a vity according to the given ID. The id should be given in the URL structure like this: /citycrud/2
2. Add an endpoint to allow POST new cities, the new cities should be added to your cities list, which is just an array in memory. The route should use the HTTP method POST and should use the URL: /citycrud
3. Add an endpoint to the API server to allow update (PUT) a city according to the given ID. The id should be given in the URL structure like this:
/citycrud/2
4. Add an endpoint to the API server to allow delete a city according to the given ID. The id should be given in the URL structure like this:
/citycrud/2

Check all the endpoints using Postman


# Workshop

In the next steps, we will building a **CMS (Content Management System)** - a
system to write, publish and save blog posts. 

Fork and Clone the [Node Girls Repo](https://github.com/node-girls/express-workshop), follow the instructions in this [link](https://node-girls.gitbook.io/intro-to-express/)



## Resources

More about HTTP:
[Tutsplus tutorial](https://code.tutsplus.com/tutorials/http-headers-for-dummies--net-8039)

Take a look at the following links to learn more about Node.js.

- Read: [The art of node](https://github.com/maxogden/art-of-node/#the-art-of-node)
- Read: [Node Resources](https://node.cool#resources)

More about JSON:

- https://en.wikipedia.org/wiki/JSON
- https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Global_Objects/JSON/parse
- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/stringify


{% include "./homework.md" %}
