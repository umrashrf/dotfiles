#!/Library/Frameworks/Python.framework/Versions/3.12/bin/python3

import re
import sys

def slugify(text):
    text = text.lower().strip()
    text = re.sub(r'[^\w\s-]', '', text)
    text = re.sub(r'[\s_-]+', '-', text)
    text = re.sub(r'^-+|-+$', '', text)
    return text

print(slugify(sys.argv[1]))
