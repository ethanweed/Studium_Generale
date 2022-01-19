#!/bin/bash

# convert course information docs to html

find ./ -iname "*.md" -type f -exec sh -c 'pandoc "${0}" -o "./html/$(basename ${0%.md}.html)"' {} \;