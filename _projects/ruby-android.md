---
hasThumbnail: true

visit:
  - anchorText: "View on GitHub"
    link: "https://github.com/jekyllex/ruby-android"
---

## Background

[JekyllEx](/project/jekyllex) currently uses GitHub APIs only. It means that it can't provide pure jekyll experience on mobile devices.

Compiling the [CRuby](https://github.com/ruby/ruby) (Ruby interpreter written in C) using [Android NDK](https://developer.android.com/ndk) toolchain would actually make jekyll binaries to possibbly run on mobile devices.

## Status

I've had success compiling CRuby with the help of [termux](https://github.com/termux) team. But I am still trying to compile cmake and binutils as the dependencies are needed to install jekyll!