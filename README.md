Site Content Stats
-----

Count the total number of words, or pages, or images, on a website.

Prerequisites
-----

Docker is required.

Example
-----

### Counting all files

Let's say we want to count the number of pages on https://blog.dcycle.com

We must first determine what is considered a page. In this case, we will determine that any page which does not contain the words "Recent Posts" is a content page. That is a list of articles, so it should not count toward the page count.

We can now run our page count script. Before we do, we need to determine what qualifies as a content page. List pages, for example, do not.

    ./scripts/count-files.sh "(html|htm)$" "https://blog.dcycle.com"

### Counting all files which contain a specific string

Only certain files in a website should be considered valid, for example in a wiki, files which contain:

    <ul class="vector-menu-content-list"><li id="ca-view" class="selected mw-list-item">

might be considered valid, because these are files where the "Read" tab is selected. You can only count those files in your wiki by running:

    ./scripts/count-files-which-contain.sh "(html|htm)$" "https://wiki.example.com" '<ul class="vector-menu-content-list"><li id="ca-view" class="selected'

### Counting all the images

    ./scripts/count-files.sh "(png|jpeg|gif|jpg)$" "https://blog.dcycle.com"

This will give you something like

    13

### Counting all words in all files

To continue with the wiki example:

    ./scripts/count-words-in-files.sh "(html)$" https://wiki.example.com '<ul class="vector-menu-content-list"><li id="ca-view" class="selected'

Will convert all files which have the pattern "html$" and which contain `<ul class="vector-menu-content-list"><li id="ca-view" class="selected` to plain text, and then proceed to count all the words in those files.



