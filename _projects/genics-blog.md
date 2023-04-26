---
hasThumbnail: true

visit: 
  - anchorText: "Visit project website"
    link: "https://genicsblog.com"

  - anchorText: "View on GitHub"
    link: "https://github.com/genicsblog"
---

## Background

I've been trying out different blogging platforms from quite a while now. I started out with WordPress, trying dev.to, medium, hashnode alongside. But well nothing suited me.

WordPress was slow even with decent hosting plans, but had a recurring cost which didn't provide enough value for investment. dev.to's primary focus wasn't technical writing, they allow everything: discussions, cross-postings, articles so things seemed cluttered.

Medium wasn't well suited for developers. Code blocks were hard to read, and the design was a bit clunky. Load times were super bad back then. Hashnode didn't allow removing footer branding even with some paid plan, so that was a no-go.

Plus, I always wanted to be blogging with my friends on a single platform as WordPress supports.

I knew the site had to be a static site, considering it should be fast to load and well as soon as I found jekyll, I started tinkering and built different static sites with it!

Once I got comfortable I built Genics' theme from ground up. The tech stack involves: HTML, TailwindCSS, Ruby, Python, Docker, Jekyll and all of the built assets are hosted completely free on GitHub Pages.

## Challenges

### No possibility for multiple authors

I realised Jekyll was actually powerful to create powerful static websites. The only problem was, multiple authors, with paginated author pages, as I wished weren't possible. But that problem as well, I fixed by building [jekyll-auto-authors](/project/jekyll-auto-authors) plugin!

### Writing experience was bad

Soon as the code-base grew, we needed to separate the articles from the theme code. Otherwise the main repository was cluttered and new authors were finding hard to navigate.

This meant we either needed to create a mono-repo separating the theme and the articles, or we had to create a separate repository for both articles and code.

I chose the latter, as it was easier to maintain and I wanted to keep the theme code as clean as possible.

We use docker to setup local environments. Checkout docker files for [main repo](https://github.com/genicsblog/genicsblog.com/blob/main/Dockerfile) and [theme-files repo](https://github.com/genicsblog/theme-files/blob/main/Dockerfile). Essentially, both do the process of combining code with articles behind the scenes so that articles and theme code can be worked on separately.

## Current stats

The blog is [open source](https://github.com/genicsblog) at heart. And this transparency has lead to a lot of growth, from 200 monthly readers to 700+ within 3 months.

We primarily rely on organic traffic, which constitutes almost half of the total traffic.

## The future

Currently, we are focused on publishing a lot quality content (the reason each submission is reviewed twice before being published).This sets up a solid base for the future. We plan to grow our userbase and keep providing value through content!

## Questions?

Do reach out to [@genicsblog](https://twitter.com/genicsblog) (Twitter) or [contact@genicsblog.com](mailto:contact@genicsblog.com) (E-mail).