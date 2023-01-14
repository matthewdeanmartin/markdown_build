#!/bin/bash
# set -euxo pipefail
bash --version

# Set tool locations
TIDY="node_modules/.bin/tidy-markdown"

echo "Working with these files"
FILES=$(find . -type f -name "*.md" ! -path "./node_modules/*")
for file in $FILES; do
    echo "$file"
done
echo

#pip install mdformat
#Install with GitHub Flavored Markdown (GFM) support:
#
#pip install mdformat-gfm
#Note that GitHub's Markdown renderer supports syntax extensions not included in the GFM specification. For full GitHub support do:
#
#pip install mdformat-gfm mdformat-frontmatter mdformat-footnote
#Install with Markedly Structured Text (MyST) support:
#
#pip install mdformat-myst

# Format the markdown files
# skip node_modules
echo "Formatting markdown files with mdformat"
find . -type f -name "*.md" ! -path "./node_modules/*" | xargs mdformat

# conflicts with adam
#for file in *.md; do
#    set -x
#    "$TIDY" < "$file" > "${file%.md}-temp.html"
#    cp "${file%.md}-temp.html" "$file"
#    rm "${file%.md}-temp.html"
#    set +x
#done

## Convert the markdown files to HTML
for file in $FILES; do
    echo "Writing $file to html"
    markdown_py "$file" > "${file%.md}.html"
done
