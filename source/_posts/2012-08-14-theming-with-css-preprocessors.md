---
tags: ['Promoted']
layout: post
title: Theming with CSS<span class="b1-break b2-unbreak"> Preprocessors</span>
---

{% excerpt %}
One thing that CSS preprocessors really help with is maintaining large colour schemes. Sometimes, however, we need not just a large colour palette, but multiple colour schemes. If a colour is used sparingly across a design, CSS preprocessors can help a great deal with swapping out that lick of paint with a new one.

In a recent project I was confronted with a design that used a primary colour simply for text and borders. The design demonstrated that different sections of the website would have the same layout, but a different primary colour for its text and borders.
{% endexcerpt %}

Let’s begin with two objects that share a colour palette (just blue for now):

    .articles-list {
      border-bottom: 1px solid blue;
    }

    .articles-list .article-title {
      color: blue;
    }

I’m sure we all know that preprocessors can improve the situation here with variables:

    $primary-colour: blue;

    .articles-list {
      border-bottom: 1px solid $primary-colour;
    }

    .articles-list .article-title {
      color: $primary-colour;
    }

## Body Rulesets

Now if I want to swap out the colours for those objects easily, I can substitute a `body` class to specify the active theme:

    /*body*/.default {
      $primary-colour: blue;

      .articles-list {
        border-bottom: 1px solid $primary-colour;
      }

      .articles-list .article-title {
        color: $primary-colour;
      }
    }

    /*body*/.sports {
      $primary-colour: green;

      .articles-list {
        border-bottom: 1px solid $primary-colour;
      }

      .articles-list .article-title {
        color: $primary-colour;
      }
    }

This is powerful because, simply by changing the class on the `body` element, we have the ability to change a whole website’s colour scheme. However, the disadvantage of our CSS is that I have to keep my colour styles separate from the rest of my style properties. Unfortunately, if I wanted all styles using `$primary-colour` to change with the body class, preprocessors aren’t clever enough to automatically generate my CSS:

    $primary-colour: blue;

    /*body*/.sports {
      $primary-colour: green;
    }

    .articles-list {
      border-bottom: 1px solid $primary-colour;
    }

    .articles-list .article-title {
      color: $primary-colour;
    }

Because of this, the compiled CSS would only provide styles for the default theme:

    .articles-list {
      border-bottom: 1px solid blue;
    }

    .articles-list .article-title {
      color: blue;
    }

## Using `@extend` to Generate Body Rulesets

A clever way of achieving what we want here is to use the [`@extend`](http://designshack.net/articles/css/extends-and-control-directives-two-crazy-things-sass-can-do-that-less-cant/) method which is available in most preprocessors (Sass and Stylus at the time of writing) alongside [parent selectors](http://thesassway.com/intermediate/referencing-parent-selectors-using-ampersand):

    /* Variables */

    $default-primary-color: blue;
    $sports-primary-color: green;

    /* Extendables */

    %brand-border-colour {
      .default & {
        border-color: $default-primary-colour;
      }

      .sports & {
        border-color: $sports-primary-colour;
      }
    }

    %brand-colour {
      .default & {
        color: $default-primary-colour;
      }

      .sports & {
        color: $sports-primary-colour;
      }
    }

    /* Objects */

    .articles-list {
      @extend %brand-border-colour;
      border-width: 1px;
      border-style: solid;
    }

    .articles-list .article-title {
      @extend %brand-colour;
    }

And our compiled CSS will look like:

    .default .articles-list {
      border-color: blue;
    }

    .default .articles-list .article-title {
      color: blue;
    }

    .sports .articles-list {
      border-color: green;
    }

    .sports .articles-list .article-title {
      color: green;
    }

This way we get to keep all of our theming styles with the rest of our styles, and therefore our code is a lot more maintainable. You could also use the colour functions provided by CSS preprocessors to extend this example, but the purpose of this article is to demonstrate how you can swap out and in entire colour schemes.
