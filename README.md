**Example blogs from HN**
* https://alexnixon.github.io
* https://www.pashabitz.com/
* https://bsdimp.blogspot.com/
* https://www.4alltech.com/
* https://zwischenzugs.com/
* https://bridge.grumpy-troll.org/
* https://dandanua.github.io/posts/major-flaws-of-human-thinking/ (very similar theme)
* https://martin.kleppmann.com/2020/12/02/bloom-filter-hash-graph-sync.html (first name subdomain of last name)

**Reference**
https://stackoverflow.com/questions/60269518/sorting-hugo-homepage-post-summaries-by-title-with-hyde-hyde-theme/60328722#60328722


Hugo prioritizes files in the root directory over themes -- hence why I override certain parts of hyde-hyde.

Front matter usage:
https://gohugo.io/content-management/front-matter/

Shortcodes:
https://github.com/htr3n/hyde-hyde/issues/96


**Project layout**
```
# many directories in this project are used to override files included by the hyde-hyde theme for my customization

archetypes/         templates for creating a new post
assets/             override hyde-hyde/assets
content/            primary blog content
    portfolio/      portfolio content
    posts/          blog posts
    about.md        single about page markdown
layouts/            override hyde-hyde/layouts
public/             auto-generated public sources
resources/          auto-generated public resources
static/             static files to also host at blog root
themes/             theme used for this blog. linked via git submodules
config.yaml         configuration values for this hugo instance
deploy.sh           i honestly cant remember; maybe for jenkins
Dockerfile          a dockerfile for this project as an http image
README.md           this file
```