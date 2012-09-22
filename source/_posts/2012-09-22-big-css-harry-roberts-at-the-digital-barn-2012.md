---
tags: ['Promoted']
layout: post
title: Big CSS – Harry Roberts at<span class="b1-break"> The Digital Barn 2012</span>
---

{% excerpt %}
The Digital Barn was a fantastic single day conference held in Barnsley, catering for all web-types. As somebody who appreciates the challenge of writing scalable and maintainable code, I was most excited to hear what Harry Roberts had to say on the subject of CSS. In his talk [Big CSS](http://www.youtube.com/watch?v=R-BX4N8egEc&hd=1), Harry re-establishes concepts such as [SMACSS](http://smacss.com/) and [OOCSS](http://oocss.org/), and then walks us through the methods, tools and mindsets necessary for working on CSS in massive projects and as part of a team. Here’s what I took away from the talk. Harry has also recorded himself presenting this talk, which is [available online for your own viewing](http://www.youtube.com/watch?v=R-BX4N8egEc&hd=1).
{% endexcerpt %}

* Managing big CSS is all about managing the CSS developers, and making sure they’re writing the code in a sensible manner.
* Strike a balance between the CSS and HTML if you’re going to keep it scalable.
* Pre-processors don’t promote a good understanding of CSS at its root. A sound knowledge of CSS architecture is more use than a pre-processor.
* Once a sound understanding of CSS architecture is acquired, that’s when you can start to use pre-processors to your advantage.

## Components and Extensions

* To write object-oriented, re-usable CSS, you have to look a level deeper into the design in order to spot patterns for abstraction – ‘a componentised web’.
* An object is just a design pattern. You don’t really care *what* it does in practice. That’s where extensions come in.
* ‘Extensions are much more specific’ – actual jobs. For example, an `nav` object might have several extensions: `user-links`, `breadcrumbs`, `site-nav`, `sponsor-logos`, `footer-nav`.
* The more discrete and versatile your components are, the more you can re-use them, and the easier it is to maintain your CSS.
* Abstractions come free-of-charge – they are already there and free to use over and over and over…
* When measuring impact to a codebase, look out for bespoke CSS. Only ever measure bespoke code (extensions).
* The ‘things’ that make up a design component are probably going to be re-used.

### Abstraction Examples
* `ui-list` – A blocky list: generic list, any type of content
* `s` – Sprite
* `ico-text` – Icons with text: sports spacing/alignment, any icon, any text

## Code Organisation and Maintainability

* [What if specificity didn’t exist?](http://www.impressivewebs.com/css-specificity-irrelevant/)
* Write rulesets in a subsequent order to take advantage of the cascade (in place of specificity).
* Subsequent rulesets should only ever inherit, never undo. If you’re undoing CSS down the stylesheet, you’re probably doing it wrong.
* Pre-processors advertise nesting as a feature. Nesting can be useful, but to sell is as a feature is very dangerous. Nesting descendants in selectors increases specificity and limits portability.
* Avoid chaining selectors. Rather, use a chained class name or a ‘modifier’ (i.e. `.error-msg` instead of `.error.msg`).
* Indenting rulesets is good because you can see the skeleton of a component easily, without referring to the HTML. It gives the next developer a lot of information at a glance.
* ‘Quasi-qualified selectors’ – we shouldn’t chain classes with element selectors for specificity reasons, but it is useful. By qualifying the selector and commenting it out, we give the next developer a lot more information, without increasing specificity (i.e. `/*html*/.product-page`)
* If you’re not using partials (pre-processors), use a table of contents instead.
* What if the next developer needs to make a new component? By commenting our CSS with tags, the developer can easily find existing styles that do similar jobs, which he/she may be able to re-use (i.e. ‘lists’, ‘tables’ or ‘layout’).
* Messy CSS is not a fault of the language. Rather, it’s a fault in the developers on the team. You need to make sure your team are all brought in to your way of working.
* People do want to do a good job, so talk to people – manage your team as well as your codebase.