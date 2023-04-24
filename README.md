# [My portfolio website](https://gourav.sh)

This is a minimal portfolio website built using Jekyll with HTML, TailwindCSS, JavaScript and Ruby (for a few custom plugins).

The website is generated using [github actions](https://github.com/gouravkhunger/portfolio/blob/jekyll/.github/workflows/publish-site.yml) and served via the [gh-pages](https://github.com/gouravkhunger/portfolio/tree/gh-pages) branch.

Here are the demo pictures of how the portfolio looks like:

<p align="center">
    <img src="https://user-images.githubusercontent.com/46792249/169602749-790ac576-415f-425e-abbc-4a3acc453b88.png" width="700"/>
</p>
<br/>
<p align="center">
    <img src="https://user-images.githubusercontent.com/46792249/169603232-ecc03153-48be-4a2c-b671-b1928323e135.png" width="700"/>
</p>

Drop this repository a :star: for the design :D

## Local Setup

Please install [Ruby](https://www.ruby-lang.org/en/documentation/installation/) and [Node.js](https://nodejs.org/en/download/) before proceeding future!

Clone the project:

```bash
git clone https://github.com/gouravkhunger/portfolio
cd portfolio
```

Install dependencies:

```bash
npm i
bundle install
```

Run local server

```bash
bundle exec jekyll serve
```

Now you can head over to [https://localhost:4000](https://localhost:4000) to preview the website locally!

## License

This project is licensed under the [MIT License](https://github.com/gouravkhunger/portfolio/blob/jekyll/LICENSE) terms.

```
MIT License

Copyright (c) 2022 Gourav Khunger

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
