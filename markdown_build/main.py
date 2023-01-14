import markdown

import subprocess
import textstat
import requests


def check_link(link):
    response = requests.get(link)
    return response.status_code == 200


def assess_reading_level(text):
    return textstat.flesch_reading_ease(text)

def parse_markdown(markdown_string):
    return markdown.markdown(markdown_string)

def build(markdown_file_path="letter.md"):
    # Validate and parse markdown
    with open(markdown_file_path, "r") as markdown_file:
        markdown_string = markdown_file.read()
    html = parse_markdown(markdown_string)

    # Format markdown nicely
    format_markdown(markdown_file_path)

    # Check spelling and grammar
    errors = check_spelling_and_grammar(markdown_string)

    # Convert markdown to HTML
    html_file_path = "path/to/html/file.html"
    convert_markdown_to_html(markdown_file_path, html_file_path)

    # Assess reading level
    reading_level = assess_reading_level(markdown_string)

    # Check links
    link = "https://www.example.com"
    link_valid = check_link(link)

    # Generate report
    report = "Reading level: {}\nSpelling and grammar errors: {}\nLink valid: {}".format(reading_level, errors,
                                                                                         link_valid)
    with open("report.txt", "w") as f:
        f.write(report)
