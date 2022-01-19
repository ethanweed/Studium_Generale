#!/bin/bash

# build html documents


# convert course information docs to html
cd /Users/ethan/Documents/GitHub/Studium_Generale/StudiumGenerale2022/CourseInfo
find ./ -iname "*.md" -type f -exec sh -c 'pandoc "${0}" -o "./html/$(basename ${0%.md}.html)"' {} \;














# Push to github

git add -A
git commit -m "auto-updated with build.sh"
git push origin master










#pandoc --standalone /Users/ethan/Documents/GitHub/ExPsyLing/2021/Planning/Syllabus.md -o #/Users/ethan/Documents/GitHub/ExPsyLing/2021/Planning/Syllabus.html


# in case you need it:
#-V revealjs-url=https://unpkg.com/reveal.js@^4/




####### Lecture slides

# Lecture 1
#pandoc -t revealjs -s -o /Users/ethan/Documents/GitHub/ExPsyLing/2021/Slides/Lecture_02_Intro.html #/Users/ethan/Documents/GitHub/ExPsyLing/2021/Slides/Lecture_02_Intro.md -V theme=solarized -V revealjs-url=https://unpkg.com/reveal.js/






# Other
#pandoc --standalone /Users/ethan/Documents/GitHub/ExPsyLing/2021/Planning/Syllabus.md -o #/Users/ethan/Documents/GitHub/ExPsyLing/2021/Planning/Syllabus.html

#pandoc --standalone /Users/ethan/Documents/GitHub/ExPsyLing/2021/Planning/Schedule.md -o #/Users/ethan/Documents/GitHub/ExPsyLing/2021/Planning/Schedule.html

# Push to github

#git add -A
#git commit -m "auto-updated with build.sh"
#git push origin master