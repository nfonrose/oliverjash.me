---
tags: ['Promoted']
layout: post
title: CSS Exceptions&#58; Object<span class="b1-break"> Modifiers or Extensions?</span>
---

{% excerpt %}
Harry Roberts recently published his thoughts on [code that smells](http://csswizardry.com/2012/11/code-smells-in-css/). In this article, Harry included a section on *undoing styles*:

> Any CSS that unsets styles (apart from in a reset) should start ringing alarm bells right away. The very nature of CSS is that things will, well, cascade and inherit from things defined previously. Rulesets should only ever inherit and add to previous ones, never undo.

This made me think about my own practices for undoing styles. In this article, I will look at methods for coding CSS exceptions with undoing styles, and then without undoing styles, to see what is the better method with regards to OOCSS.
{% endexcerpt %}

## Introduction

Imagine we have a `widget` object. Our `widget` has a border, some padding, and some font sizing:

    /* Object */
    .widget {
      border: 1px solid #ccc;
      padding: 0.5em;
      font-size: 12px;
    }

Let’s just say that `widget` object is used **four times** on the page. Our design also has another kind of widget, which has all the same properties as `widget`, but no padding or border. This widget, however, only appears **one time** on the page.

## Using Object Modifiers

What we could do is add an *object modifier* for the exception (that, remember, only appears once on the page). Let’s call ours `widget-secondary`.

    /* Object */
    .widget {
      border: 1px solid #ccc;
      padding: 0.5em;
      font-size: 12px;
    }

    /* Object modifier (Exception) */
    .widget-secondary {
      /* unset */
      border: none;
      /* unset */
      padding: 0;
      font-size: 12px;
    }

Our object, `widget`, assumes that all widgets will have a border and padding. Our object modifier, `widget-secondary`, just unsets the properties that are not needed for the exception.

This method requires the developer to analyse the design and decide on *defaults*. For instance, here we recognised that 4/5 widgets had a padding and border, so the `widget` object inherited those styles, whereas `widget-secondary` opts-out of those styles to create the exceptions.

By creating a modifier for the exception, we only have to concatenate additional classes in our HTML for the exceptions:

    <div class="widget">…</div>
    <div class="widget">…</div>
    <div class="widget">…</div>
    <div class="widget">…</div>
    <!-- Exception -->
    <div class="widget widget-secondary">…</div>

## Using Object Extensions

Going back to Harry’s argument that CSS which unsets properties is smelly code, Harry instead argues that ‘rulesets should only ever inherit and add to previous ones, never undo’. To adhere to this principle, we must replace our object modifier with an *object extension*. In this example, we will call it `widget-primary`:

    /* Object (Exception) */
    .widget {
      font-size: 12px;
    }

    /* Object extension */
    .widget-primary {
      border: 1px solid #ccc;
      padding: 0.5em;
    }

Here we are not undoing any styles, so our CSS is shorter.   Maintenance is easier because we don’t have to remember that any styles we add to `widget` also need to be undone by a modifier. But because we now have to opt-in for even the most common styles (border and padding), we have more classes in our HTML:

    <div class="widget widget-primary">…</div>
    <div class="widget widget-primary">…</div>
    <div class="widget widget-primary">…</div>
    <div class="widget widget-primary">…</div>
    <!-- Exception -->
    <div class="widget">…</div>

## Conclusion

In conclusion, it seems that by analysing the design to decide on defaults, and undoing styles for any exceptions that occur thereafter, our CSS becomes more complex. We have to remember that any styles added to an object might also have to be maintained (modified or undone) in any object modifiers. This can be overcome by replacing object modifiers with object extensions, but then we have to concatenate additional classes in our HTML.

In the past, I have always used object modifiers (undoing styles) myself in an attempt to refrain from adding more classes in my markup. However, this appears to be [just another reason why you should defer work to your HTML](/2012/09/07/methods-for-modifying-objects-in-oocss.html) in order to keep your CSS tidy and maintainable. In the future I will be using object extensions instead. If you’re still uncomfortable littering your HTML with classes, then have a look at [this case study by Harry Roberts](https://gist.github.com/4136435) which demonstrates how small of a difference it makes it file sizes.
