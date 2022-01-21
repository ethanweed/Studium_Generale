#!/bin/bash


## Lecture Slides

cd /Users/ethan/Documents/GitHub/Studium_Generale/StudiumGenerale2022/Slides
for i in *.md ; do echo "$i" && pandoc -s -t revealjs -s -V revealjs-url=https://unpkg.com/reveal.js/ $i -o html/$i.html ; done

# Push to github

git add -A
git commit -m "auto-updated with build.sh"
git push origin master