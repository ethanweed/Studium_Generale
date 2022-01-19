#!/bin/bash

# build html documents

find ./ -iname "*.md" -type f -exec sh -c 'pandoc "${0}" -o "./output/$(basename ${0%.md}.html)"' {} \;

#pandoc --standalone /Users/ethan/Documents/GitHub/ExPsyLing/2021/Planning/Syllabus.md -o /Users/ethan/Documents/GitHub/ExPsyLing/2021/Planning/Syllabus.html


# in case you need it:
#-V revealjs-url=https://unpkg.com/reveal.js@^4/




####### Lecture slides

# Lecture 1
#pandoc -t revealjs -s -o /Users/ethan/Documents/GitHub/ExPsyLing/2021/Slides/Lecture_02_Intro.html /Users/ethan/Documents/GitHub/ExPsyLing/2021/Slides/Lecture_02_Intro.md -V theme=solarized -V revealjs-url=https://unpkg.com/reveal.js/






# Other
#pandoc --standalone /Users/ethan/Documents/GitHub/ExPsyLing/2021/Planning/Syllabus.md -o /Users/ethan/Documents/GitHub/ExPsyLing/2021/Planning/Syllabus.html

#pandoc --standalone /Users/ethan/Documents/GitHub/ExPsyLing/2021/Planning/Schedule.md -o /Users/ethan/Documents/GitHub/ExPsyLing/2021/Planning/Schedule.html

# Push to github

#git add -A
#git commit -m "auto-updated with build.sh"
#git push origin master