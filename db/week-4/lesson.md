![](https://img.shields.io/badge/status-draft-darkred.svg)

# Node - Week 3

---

**Teaching this lesson?**

Read the Mentors Notes [here](./mentors.md)

---

## Contents

- [Node Recap](#node-recap)
- [Authentication](#authentication)
- [Security](#security)
- [Best Practices](#best-practices)
- [Login Workshop](#login-workshop)

---

## Node Recap

Javascript has evolved from the browser to be used in the backend. It does not need a framework as we saw in [week-13](../week-13/lesson.md), however a framework like Express allows us to develop faster.

### Documentation

When you are working with frameworks it is always helpful to use their documentation.

- [Express Documentation](https://expressjs.com)
- [Node.js Documentation](https://nodejs.org/api/http.html)

### Middleware

Middleware allow us to process requests to add functionalities that are not built in to Express, for example logging, authentication, etc.

> - Express Documentation: [Using Middleware](https://expressjs.com/en/guide/using-middleware.html)
> - Video: [body-parser](https://www.youtube.com/watch?v=vKlybue_yMQ) which makes it easier to work with POST requests and forms.

## Authentication

Routing refers to how an application’s endpoints (URIs) respond to the client requests. These are configured differently for each framework, and can range from basic configuration to very extensive for more complex use cases.

Simple example

```js
app.get("/", function (request, response) {
  res.send("hello world");
});
```

Sometimes you need to add user functionality for your website. Example using `express-session` for authentication

```js
app.get('/', (request, response) => {
    if (request.session.loggedin) {
        response.send('Welcome back, ' + request.session.username + '!');
    } else {
        response.send('Please login to view this page!');
    }
    response.end();
});
```

To understand express-session, we need to know first, what is a session and a cookie?

- Session: is a single interval of time in which the user is authenticated.
- Cookie: are used to collect identifying information about the user, such as Web surfing behavior or user preferences for a specific Web site, also are used to store user sessions. Depending on the management, Cookies are stored during a specified period of time, in the browser or in the hard drive

> - Read the [Basics on Authentication](https://www.sohamkamani.com/blog/2017/01/08/web-security-session-cookies/) to understand better the process.

**Exercise:** Create a server using express-session by following the next [steps](https://www.geeksforgeeks.org/session-management-using-express-session-module-in-node-js/)

> - Example: [express-session-example](https://medium.com/javascript-in-plain-english/storing-user-sessions-on-the-server-with-express-session-422fe11bc500)
> - Documentation: [express-session](http://expressjs.com/en/resources/middleware/session.html)

> For more information of other and more complex authentication methods read:
> - [OAuth 2.0 Authorization Framework: Bearer Token Usage](https://tools.ietf.org/html/rfc6750)
> - [Json Web Tokens](https://medium.com/@weinberger.ariel/json-web-token-jwt-the-only-explanation-youll-ever-need-cf53f0822f50)

## Security

When you take your website to production there is a whole range of things to consider.

![HTTP vs HTTPS](../assets/http-vs-https.png)

Node has built in support for HTTPS, and once you have your own certificates you can use this feature. However sometimes when you deploy to `cloud` Platform Platform as a Service (PaaS) providers such as Heroku, they provide SSL and configure it for you automatically.

> - Read: [Node: HTTPS](https://nodejs.org/api/https.html)
> - Read/Watch: [What is an SSL Certificate?](https://www.globalsign.com/en/ssl-information-center/what-is-an-ssl-certificate/)
> - Read: [Heroku SSL](https://devcenter.heroku.com/articles/ssl)

## Best Practices

Express have their own recommended [best practices page](https://expressjs.com/en/advanced/best-practice-performance.html)

### REST

REST is a convention of how to design your API, whether it is for your own frontend, or other frontends and clients.

> - Read: Resource naming in [REST](http://www.restapitutorial.com/lessons/restfulresourcenaming.html) convention

## Login Workshop

Get in to groups of 3/4 and checkout the [login workshop](https://github.com/Migracode-Barcelona/migracode-users-session).

{% include "./homework.md" %}
