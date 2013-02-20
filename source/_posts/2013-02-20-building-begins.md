---
layout: post
title: Building Begins
---

{% excerpt %}
I'm now onto the building phases of my final year project. In the past four weeks, my technical research prior to the building phase has already paid its dividends. At the same time, my technical research has been necessary alongside the building itself, in aid of using the best tools for the job.
{% endexcerpt %}

## Technologies

There are dozens of important considerations I have to make when architecting the codebase for this project:

<figure>
  <img class="img-centered" src="/images/spa-list-cloud.png" alt="Things to consider for building a single page application">
  <figcaption>Things to consider when building a single page application. Original by <a href="http://net.tutsplus.com/tutorials/javascript-ajax/important-considerations-when-building-single-page-web-apps/" title="Important Considerations When Building Single Page Web Apps">Pavan Podila</a></figcaption>
</figure>

The Express application that I built for a prototype is where I continued. Having already made the decision to use Node.js with Express.js on the back-end, my first task was to consider which tools were the best for the job on the front-end.

Work I have done on single page applications (SPAs) previously informed my decision to use [Backbone.js][] – for giving structure to the front-end application – and [RequireJS][] – for  providing structure to my files through the power of [AMD][]. An additional technology I needed to consider adding to the stack was a template compiler, and for this I decided on [Handlebars.js][]. Fortunately I was familiar with most of these tools already.

The first learning curve I had to face was that of [Grunt][], a JavaScript task runner for automating things. The Grunt website answers why you should use a task runner:

> The less work you have to do when performing repetitive tasks like minification, compilation, unit testing, linting, etc, the easier your job becomes. After you've configured it, a task runner can do most of that mundane work for you—and your team—with basically zero effort.

I want to ensure my application is as optimised as possible, and employing a task runner will help me to achieve this. I spent several days tinkering with my Grunt setup, with the goal of compiling and minifying my CSS with the chosen preprocessor (Sass), pre-compiling my templates, and linting, concatenating, and minifying my JavaScript. All of this required several Grunt tasks which I had to do research for, and putting it all together was eventually accomplished – after reaching for help on IRC.

I have started to build the [REST][] API, which will be used by the Backbone application for fetching and saving data. Thus far, I have built a resource for links – which utilises **create, read, update and delete** (CRUD), 'the four basic functions of persistent storage.' Prior to development, designing how the API for this resource should work took some research, and I ended up purchasing a copy of the [REST API Design Rulebook][] to help inform my decisions with best practices. The development itself has, so far, been the easy part, although I have decided to attempt a development process called [Test-driven development][] (TDD) which – due to the learning curve involved – has slowed me down. That said, unit testing is a valuable skill to have, and if this project is to reach beyond its existence as my thesis, then having unit tested code will help considerably when it comes to scaling, refactoring, and maintaining the project.

Work has been started on the front-end application, which should represent the largest part of this project. However, I consider it important to get the REST API done right before moving on to building the fully-fledged front-end application, because this will in-turn reflect how I architect my Backbone.js code.

## Tooling

As well as learning new technologies, I am also trying to improve my development process through the use of various tools.

In the past I have used Stack Overflow for solving any problems I've had, but I recently discovered that there is a chat room on IRC for just about everything in the web developer's toolbox. I have found the answers to many of my questions on there. Furthermore, I have had discussions with certain individuals on IRC who have lead me to making better architectural decisions. On the whole, IRC has been invaluable and it's surely going to help me become a better developer.

I am also trying to improve my knowledge of Git and the shell throughout the course of this project. These are two tools I will most likely use throughout the course of my career, so the more skilled I can become with these two tools, the faster I will be able to work. It is for this reason that small things have sometimes taken me longer than they should have – I can continuously reviewing my development process to see where I could adopt tools and where I can improve.

## Project Management

I am utilising [Trello][] for keep track of the things I need to do, am doing, and have done. I used this website for project management whilst working as a web developer at Clock, and it worked very well. It's working well for me so far.

<img class="img-centered" src="/images/Screen Shot 2013-02-20 at 18.11.55.png">

If all goes to plan, the next blog post should be much more about building the front-end to this project.

[Pavan Podila]: http://net.tutsplus.com/tutorials/javascript-ajax/important-considerations-when-building-single-page-web-apps/  "Important Considerations When Building Single Page Web Apps"
[Grunt]: http://gruntjs.com/  "Grunt: The JavaScript Task Runner"
[Backbone.js]: http://backbonejs.org/  "Backbone.js"
[RequireJS]: http://requirejs.org/  "RequireJS"
[AMD]: http://requirejs.org/docs/whyamd.html  "Why AMD?"
[Handlebars.js]: http://handlebarsjs.com/  "Handlebars.js: Minimal Templating on Steroids"
[REST]: http://en.wikipedia.org/wiki/Representational_state_transfer  "REST: Representational state transfer"
[REST API Design Rulebook]: http://shop.oreilly.com/product/0636920021575.do  "REST API Design Rulebook"
[Test-driven development]: http://en.wikipedia.org/wiki/Test-driven_development  "Test-driven development"
[Trello]:  http://trello.com/  "Trello"
