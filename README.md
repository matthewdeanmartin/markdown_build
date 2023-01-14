# markdown_build

This is a multi-tool markdown build script. By that I mean, it checks and transforms the markdown.
But it also looks at the quality of the English.

This would be used in conjunction with some other tool, like Github pages or pelican.

Transformations: format, compile to HTML

Checks: markdown linting, spelling, tone, grammar, hyperlinks

## Installation

```bash
pip install markdown_build
```

## Usage

Locally, run `report.sh` to autoformat and then get a listing of potential problems.

Because this is English many of these problems might be fine to live with.

Optionally, run `build.sh` to autoformat and do a trial conversion to HTML.

Formatters
- mdformat
- tidy-markdown
- https://github.com/GitbookIO/markdown-tools
- formd

## Ideas for the future

- Add Table of Contents (https://github.com/rasbt/markdown-toclify)
- Switch from inline to referenced URLs (https://github.com/seth-brown/formd) 
- Format, lint, test code in markdown code blocks. (Traditional build script tasks, but your code is in Markdown)
- Convert from Word, etc to Markdown (Use a rich environment to edit, then convert to something Jekyll and Pelican
  support)
- Convert from Markdown to PDF, LaTeX, etc. (https://github.com/parrt/bookish)
- Handle transclusion (inserting one markdown file into another, e.g. footer boilerplate)
- Split one document with many languages to many ones with one languages https://github.com/codenautas/multilang
- CSV to markdown table (https://github.com/monochromegane/mdt)