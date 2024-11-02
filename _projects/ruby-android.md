---
hasThumbnail: true

visit:
  - anchorText: "View on GitHub"
    link: "https://github.com/jekyllex/ruby-android"
---

<details>

<summary class="mb-2" markdown="span">View May 2022 version of the following text</summary>

## Background

[JekyllEx](/project/jekyllex) currently uses GitHub APIs only. It means that it can't provide pure jekyll experience on mobile devices.

Compiling the [CRuby](https://github.com/ruby/ruby) (Ruby interpreter written in C) using [Android NDK](https://developer.android.com/ndk) toolchain would allow jekyll binaries run on Android devices.

## Status

I've had success compiling CRuby with the help of [termux](https://github.com/termux) team. But I am still working on bundling the binaries in the JekyllEx app for their native execution.

</details>

---

## Background

[JekyllEx](/project/jekyllex) began as an android app to edit content of Jekyll based sites hosted on GitHub, from the convinience of a mobile device.

But being able to edit only the content made it just another subset of apps to edit GitHub repo files. It could not provide pure jekyll experience on mobile devices.

Since the maintainers of jekyll [mentioned that concern](https://talk.jekyllrb.com/t/introducing-jekyllex-manage-your-jekyll-blog-from-your-android-device/6439/2?u=gouravkhunger), I took on to compile native binaries of every thing jekyll would requires to run purely on device.

## TLDR

- 3 years, 1000+ hours, 400+ builds.
- Worked with 4 huge open source teams.
- Built a fully functional, bootstrap that includes the ruby ecosystem, git and github-pages environment.
- Embedded in Jekyll to provide seamless experience with editing jekyll sites offline.

## Journey

[Android NDK](https://developer.android.com/ndk) allows compiling C/C++ code to let them run on android devices' CPU architecture. And it was evident that if the ruby interpreter were somehow be embedded in the app, it would allow jekyll to run.

I verified that the [Termux](https://github.com/termux) app did somehow enable using jekyll on android devices.

But termux back then did not support Android 10 and above because of android's updated [W^X security policy](https://developer.android.com/about/versions/10/behavior-changes-10#execute-permission). This means software can't be executed at runtime unless it is pre-packaged into the app.

For a long time termux did not update their target Android SDK to avoid having to deal with that - for there's no way to be able to pre-package the huge list of software they support.

With apps like JekyllEx too - it was a deal breaker. There are an ton of ruby gems that one can use with jekyll. And without the ability to download and execute them at runtime, the app won't be of enough use.

I did not want to resort to target a lower SDK because that meant missing out on 5 major Android releases and the features they brought.

But I wanted to at least, to be able to get things running to feel good about the time I had put in, for once.

Almost an year and numerous trials & errors later in 2022, I [had success](https://x.com/gourav_khunger/status/1556592110240903168) compiling CRuby for android with the help of the termux team using their build system.

- Made [10+ bug reports](https://github.com/termux/termux-packages/issues?q=author%3Agouravkhunger) at termux's build system repo and learnt fixing things. Months of resolution times.<br>
*Open source is slow!*
- Hours of navigating dead docs because this level of depth is hardly accessible. We are years of abstractions ahead and the internals are not beginner friendly.
- The build times were a mess. Each small change took hours to compile. Only to either get some compile time issue or a runtime bug.
- Dreaded how people would so effortlessly come with up software patches to make things work the way they want them to.

But even though it was somewhat working - I thought I could never polish it enough, use the latest toolchain and ship an actually useful package.

For months I lost hope and could not find motivation to be able to put in effort, it had already taken enough.

Over time, I did come across the ability to execute external scripts using [the system linker](https://github.com/agnostic-apollo/Android-Docs/blob/f89b5a310ce21a9aa97245f5ca0ccd5d1e46bcc4/site/pages/en/projects/docs/apps/processes/app-data-file-execute-restrictions.md#system-linker-exec) even if the scripts were not pre-loaded. This was great!

With that, I thought I could use the latest compile target - bundle ruby and have ruby gems working too. Few monthlong hiccups here and there, I got things setup.

- `gem` commands [didn't worked initally](https://github.com/termux/termux-packages/issues/20359).

  The termux team didn't care for Android 10. The people there are really knowledgeable and could help, but it's overwhelming. I realise why open source people are undervalued and don't get enough for the work they do.

  This was the first time I had the opportunity to dive into an internal issue top down alone. With some help being pointed in the right direction, I was able to fix and [demo it](https://github.com/gouravkhunger/android10-ruby-termux-demo).

- I could pre-embed the built bootstrap, but injecting default gems was nowhere documented.

  I literally made [a patch to apply patches](https://github.com/jekyllex/ruby-android/blob/a32fdc5b3a4d1626536205ab31bd2a888db41b15/patches/ruby/rbinstall.rb.patch) and structure up easily.

  Bundled gem versions needed to be [manually entered](https://github.com/jekyllex/ruby-android/blob/a32fdc5b3a4d1626536205ab31bd2a888db41b15/patches/ruby/bundled_gems.patch). Ask me how I figured out how this file controls default bundled gems.

  Effectively, it allowed ruby based gems to execute fine. It was great. Not till long.

- Welcome gems [with native extensions](https://guides.rubygems.org/gems-with-extensions/).

  Some important gems like nokogiri, google-protobuf, etc that jekyll depends on have C/C++ based extensions. Ruby compiles them on device. This is not possible because the bootstrap won't contain a compiler.

  I tried including clang from LLVM. But it was huge. compiling it for 4 CPU arches, 300mb output for each. the bootstrap alone was 1.2GB. Build times went up to 5.5 hours for each time. I'd be broke if GitHub Actions weren't free.
  
  Even though this allowed to really replicate jekyll on android. This was not feasible considering distribution. Android APKs effictively being ZIP files (not ZIP64) allow for upto 65k files hard limit, This was not the way to go.
  
  On a random day I ended up thinking why not take the GitHub pages route. Let's [whitelist certain gems](https://pages.github.com/versions). While supporting them officially, allow purely ruby-based gems to work, being a bit than GitHub Pages.

  It felt it was a genious idea. Despite having to fix broken compilation steps based on target and host architecture, to port 6 year old codebases (hello eventmachine, nokogiri was no easy candidate too) it was worth it.

- Jekyll would work, but a major gem - saas - kept complaining that the saas binary couldn't be executed.

  I patched the internal [`open3.rb`](https://github.com/jekyllex/ruby-android/blob/a32fdc5b3a4d1626536205ab31bd2a888db41b15/patches/ruby/open3.rb.patch) file to use the sytem linker whenever the program flow needed to execute something.

Finally things started to ease up. Not mentioning the other bugs with bundler gem installations, that I also ended up [contributing to](https://github.com/rubygems/rubygems/pull/7951). Git and Jekyll patches, tons of exciting stuff.

A lot of testing, back and forth with things, lots of ups and downs.

**1st July, 2024**: The first version of the bootstrap was released! 🎉

The bootstraps were still big: 75mb per arch, but way better than what it were at with LLVM. I was able to apply some optimizations to the build steps and bring it down to 60mb each in the later release!

## FAQs

#### Just, why?

Obsession

#### Are you mad?

Lol

#### Is Jekyll dead?

Apparently it's called to be feature rich. But anyhow, a project dies when the community doesn't take interest in it anymore.
