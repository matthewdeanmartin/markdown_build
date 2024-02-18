import antimarkdown
import markdownify
import html5lib_to_markdown
import requests
import markpickle

response = requests.get("https://pypi.org/project/markpickle/")

# antimarkdown leaves lots of divs!
# marks = antimarkdown.to_markdown(response.text)
# marks = markdownify.markdownify(response.text)
marks = html5lib_to_markdown.transform(response.text)
dicts = markpickle.loads(marks)
print(dicts)