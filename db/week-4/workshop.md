![CYF Workshop](../assets/workshop.png)

# CYF Hotel Workshop

* [Introduction](#introduction)
* [Problem Statement](#problem-statement)
* [User Journeys](#user-journeys)
* [Team Work](#team-work)
* [Learning Outcomes](#learning-outcomes)

## Introduction

**Brief**: Designing a hotel website

**Client**: CYF Hotels Ltd

**Date**: 28 January 2018

**Facilitators**: CYF Mentors

Now that you are almost a full-stack developer, we would like you to make us a website for our imaginary hotel.

Since you have a limited time, there is already an empty boilerplate project for you to take and build on top of.

In keeping with times, we are using the [Lean model](https://en.wikipedia.org/wiki/Lean_services) and only developing features that we see necessary for the _Minimum Viable Product (MVP)_.

## Problem Statement

Currently hotel website is a little empty. Although some raw data is available from recording things on a computer, **Hotel Manager** and **Receptionists** do not have ways to view them in a useful way.

Similarly the hotel **Customers** cannnot get a link to their invoices online to view or pint them, so they are also unhappy.

## User Journeys

![Personas](../assets/persona.png)

We are looking at three personas today:

* Hotel Customer
* Hotel Receptionist
* Hotel Manager

`As a < type of user >, I want < some goal > so that < some reason >.`

* As a _Hotel Manager_, I want to **view a list of all customers**
* As a _Hotel Manager_, I want to **view a customers details by their customer account ID**
* As a _Hotel Manager_, I want to **view a list of all invoice**
* As a _Hotel Manager_, I want to **view a an invoice by it's Invoice ID**

* As a _Hotel Receptionist_, I want to **list of all reservations**
* AS a _Hotel Receptionist_, I want to **view a reservation by it's reservation ID**

* As a _Hotel Customer_, I want to **view my invoice page**

## Team Work

We need you to work in a team by dividing up the work

| Role               | Responsibility                  |
| ------------------ | ------------------------------- |
| Backend            | API, data                       |
| Frontend           | HTML/CSS/Templates (Handlebars) |
| PM/User Experience | User journeys, tickets          |

As a student you can have multiple roles.

Get a mentor to help provide direction/focus for your team.

The PM creates tickets on Trello and assigns them between the team members

## Learning Outcomes

The important concepts for this workshop is learning how to:

* Work in a team
* Plan
* Consider user journey
* Consider your data structures
* Deliver a solution, no matter how minimal it may be
* Present your experience: your challenges

Also see deliverables in the repository `README.md`.


# Deploying to Heroku

Heroku is a cloud platform as a service (PaaS) that lets companies build,
deliver, monitor, and scale apps. Developers use Heroku to deploy, manage, and
scale modern apps. Heroku is fully managed, giving developers the freedom to
focus on their core product without the distraction of maintaining servers,
hardware, or infrastructure.

1. [Signup for an account](https://signup.heroku.com/) on Heroku
   - It will send a verification to your email so make sure you've entered a
     valid email
1. Download the [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli#download-and-install)
1. We need to do a small tweak to our app to be ready to be deployed on Heroku.

On server.js, add the `process.env.PORT` bit of code

```js
app.listen(process.env.PORT || 3000, function () {
  console.log("Server is listening on port 3000. Ready to accept requests!");
});
```

This tells our server to look for an **environment variable** called `PORT` and
use it to run the server, otherwise use Port 3000. When the server runs on
heroku, then Heroku sets the `PORT` to the correct value.

`git add` and `commit` your change.

4. Now open the command line in the folder where you have your
   **express-workshop** repo running. If you run the command `git remote -v`,
   you should see one remote **origin** pointing to your repo.

Run these commands:

`heroku login`

> This will ask you for your heroku email and password that you used to
> register.

Once you're logged in:

`heroku create`

> The heroku create command creates a new application on Heroku – along with a
> git remote that must be used to receive your application source.

If you check `git remote -v`, you should see a second remote called **heroku**.

Now push your code to heroku `git push heroku master`. The push will run few
commands from Heroku, then you should see a url similar to
`https://some-random-name-XXXX.herokuapp.com` - go to the URL and if all goes
well, your app should be up and running.

To read more about Heroku and deploying Node Apps to Heroku, check:

1. [Deploying with Git](https://devcenter.heroku.com/articles/git)
1. [Getting Started on Heroku with Node.js](https://devcenter.heroku.com/articles/getting-started-with-nodejs#set-up)
