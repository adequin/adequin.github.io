from pygments import highlight
from pygments.lexers import PythonLexer
from pygments.formatters import HtmlFormatter
import io

# Load your Python code
with open('/Users/andy/Desktop/website/adequin.github.io/Cells_models/python/UROP_create_cell.py', 'r') as file:
    code = file.read()

# Convert to HTML
formatted_code = highlight(code, PythonLexer(), HtmlFormatter(full=True, linenos=True))

# Save the HTML
with open('highlighted_code.html', 'w') as file:
    file.write(formatted_code)