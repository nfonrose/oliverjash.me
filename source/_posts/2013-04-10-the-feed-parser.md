---
layout: post
title: The Feed Parser
---

{% excerpt %}
The `feedParser` script I've created will take any URL and perform all the necessary actions to create a feed entry in the database as well as fetch the latest links from that RSS feed.
{% endexcerpt %}

The script works by like this:

1. A request is made to the URL, which returns the document's HTML.
2. The document's HTML is parsed through JSDom so that queries can be performed in a jQuery-esque manner
3. The parsed HTML document is then handed off to a `documentParser` script I wrote, which:
  * runs a script to find the RSS feed URL in the document, using an especially engineered batch of queries, such as `el.find('link:regex(type,application\\/(atom|rss)\\+xml)').attr('href')`
  * runs a script to find the URL of any icon provided to represent the feed and to be used as an avatar further down the line in the application. This is done with another batch of queries, which is ran in the order of preference (larger and higher quality matches come first, such as `apple-touch-icon`, whereas low quality matches come last, such as `favicon`).
4. The feed and the parsed data is saved to the database.
5. A request is made to the RSS feed URL which was found in step 3.1, which will return the XML data for that feed but encoded as JSON.
6. For each returned article/link entity, an additional request is made to the entities URL, which will return the entities HTML.
7. The returned HTML is processed by a text extractor which will attempt to precisely strip out the advertisements and other unrelated content. (This is done because the majority of RSS feed URLs only return an excerpt of the entity, so we have to manually fetch the whole thing.)

When a user requests to see links from a certain feed, a job is created in the message queue to update the feed and fetch any new links. Once again, the `feedParser` will perform the necessary actions, but this time checking whether (1) the feed XML/data has been modified since the last check (achieved by caching the HTTP request header `Last-Modified` with the feed entity in the database) and (2) if the feed is fetched, comparing the returned data with the links already in the database. To clarify the uniqueness of an article, I check against the title and date. This is because often articles are edited many times after being published, and it is necessary to cache all updated versions. These steps intersect with steps 5 through to 7, which are repeated every time a feed is updated.

By using a message queue I have managed to take the processes of `feedParser` and `documentParser` away form the main application thread. If I didn't use a message queue, these processes would block the Node.js event loop, and the application would very likely be completely unaccessible. Fortunately, Node.js allows us to easily spawn child processes, which is what is done here.

Once these processes are off the main thread, there is still a concern about the performance of these processes, especially as  they are responsible for handling potentially millions of feed and link entities. In the process flow described above, there are multiple requests made in order to fetch the necessary data for the next step. By profiling my application I have learnt that these network requests are not harmful, but rather what I should be concerned about is the parsing of HTML documents. Processing the job of downloading links with a concurrency of 20 jobs, my development machine's Node process runs at up to 100% CPU, and this is because of the parsing of HTML with JSDom. I have used this utility to make it easier to find data such as the URL of RSS feeds and icons (described previously), but in hindsight it would be much more performant to use plain regular expressions to find the data that is needed. If the application is to scale, this change will be absolutely necessary later down the line, but I have skipped this for now because of time constraints.

The `feedParser` is one of the central pieces to this application. A majority of my development time has been spent on this, and it will continue to require maintenance as the project continues, and as edge cases continue to reveal themselves in the testing stages.
