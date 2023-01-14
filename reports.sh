#!/bin/bash
# set -euxo pipefail
bash --version

# Set tool locations
ALEX="./node_modules/.bin/alex"
TIDY="node_modules/.bin/tidy-markdown"
MARKDOWNLINT="./node_modules/.bin/markdownlint"

echo "Working with these files"
FILES=$(find . -type f -name "*.md" ! -path "./node_modules/*")
for file in $FILES; do
    echo "$file"
done
echo

echo "Linting markdown files with adam"
npx alex
# "$ALEx"

echo "Linting markdown files with markdownlint"
"$MARKDOWNLINT" ./**/*.md --ignore node_modules --ignore .git --ignore .idea

echo "Checking links in markdown files with linkcheckMarkdown"

for file in $FILES; do
    linkcheckMarkdown "$file"
done


echo "Checking with proselint"
for file in $FILES; do
    proselint "$file"
done

echo "Checking links in markdown files with write-good"
for file in *.md; do
    npx write-good "$file"
done

echo "Readability scores"
for file in $FILES; do
  python readability.py "$file"
done

echo "Checking spelling/grammar with ginger (remote API)"
npx textlint --rule textlint-rule-ginger *.md
