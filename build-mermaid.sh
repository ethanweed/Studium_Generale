#!/bin/sh

# Render all mermaid figures in image folder

cd /Users/ethan/Documents/GitHub/Studium_Generale/StudiumGenerale2022/Slides/Images

for i in *.md ; do mmdc -i "$i" -o "/Figures${i%.*}.png" -b transparent; done

cd /Users/ethan/Documents/GitHub/Studium_Generale/StudiumGenerale2022/Slides/Images/Figures
for i in *.png ; do convert "$i" "${i%.*}.jpg" ; done

# Push to github

git add -A
git commit -m "auto-updated with build-mermaid.sh"
git push origin master



for i in *.jpeg; do sips -s format png -s formatOptions 100 "${i}" --out "${i%jpeg}png"; done
