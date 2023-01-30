Count words in files
-----

./scripts/count-words-in-files.sh requires 3 parameters:

* The first parameter is the pattern for file name, for example "(html|php)$"
* The second parameter is a website, for example https://blog.dcycle.com
* The third parameters is the pattern for what the file should contain to be valid. For example, for a wiki file to be considered a valid file, it should contain '<ul class="vector-menu-content-list"><li id="ca-view" class="selected mw-list-item">'

This will convert all files to plain text, then count all words in all the files.
