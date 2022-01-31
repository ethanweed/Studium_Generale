#!/bin/bash


## Lecture Slides

cd /Users/ethan/Documents/GitHub/Studium_Generale/StudiumGenerale2022/Slides
#for i in *.md ; do echo "$i" && pandoc metadata.yaml -s -t revealjs -s -V revealjs-url=https://unpkg.com/reveal.js/ #--include-in-header=styles.css $i -o html/$i{.md}.html ; done

for i in *.md ; do echo "$i" && pandoc metadata.yaml -s -t revealjs -s -V revealjs-url=https://unpkg.com/reveal.js/ --include-in-header=styles.css $i -o html/$(i${0%.md}.html) ; done

# Push to github

git add -A
git commit -m "auto-updated with build.sh"
git push origin master

