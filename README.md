Site Content Stats
-----

Count the total number of words, or pages, or images, on a website.

Prerequisites
-----

Docker is required.

Example
-----

Let's say we want to count the number of pages on https://blog.dcycle.com

We must first determine what is considered a page. In this case, we will determine that any page which does not contain the words "Recent Posts" is a content page. That is a list of articles, so it should not count toward the page count.

We can now run our page count script. Before we do, we need to determine what qualifies as a content page. List pages, for example, do not.

    ./scripts/count-files.sh "(html|htm)$" "https://blog.dcycle.com"

This will give you something like

    178

Let's say you want to count the images

    ./scripts/count-files.sh "(png|jpeg|gif|jpg)$" "https://blog.dcycle.com"

This will give you something like

    13

Counting all words in all pages, you first need to defined what is considered a "content page". A content page will need to have a file ending (for example "(html|htm)$"), as well as a grep pattern which qualifies it as a content page.




