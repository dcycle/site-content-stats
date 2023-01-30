Clone website
-----

Clone a website if it has not yet been cloned.

For example:

    ./scripts/clone-website.sh "https://blog.dcycle.com"

If you want to force fetch a new version, run:

    rm -rf ./do-not-commit/websites/blog.dcycle.com
    ./scripts/clone-website.sh "https://blog.dcycle.com"
