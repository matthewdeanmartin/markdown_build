import language_tool_python

def check_spelling_and_grammar(text):
    # requires OpenOffice
    return language_tool_python.correct(text)