#!/bin/bash

# build html documents


# convert course information docs to html
cd /Users/ethan/Documents/GitHub/Studium_Generale/StudiumGenerale2022/CourseInfo
find ./ -iname "*.md" -type f -exec sh -c 'pandoc "${0}" -o "./html/$(basename ${0%.md}.html)"' {} \;


# Push to github

git add -A
git commit -m "auto-updated with build.sh"
git push origin master