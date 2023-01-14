import subprocess


def convert_markdown_to_html(markdown_file_path, html_file_path):
    subprocess.run(["pandoc", markdown_file_path, "-o", html_file_path])