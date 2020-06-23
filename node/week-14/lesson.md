![](https://img.shields.io/badge/status-review-orange.svg)

# Node - Week 2

---

**Teaching this lesson?**

Read the Mentors Notes [here](./mentors.md)

---

## Contents

- [APIs](#apis)
- [Workshop](#workshop)

---



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



## Workshop

Fork and clone the repository [API Workshop](https://github.com/alferpal/migracode-express-workshop-2), and follow the [API Workshop steps](https://github.com/alferpal/migracode-express-workshop-2/blob/master/workshop.md)



{% include "./homework.md" %}
{% include "../../others/escalation-policy.md" %}
