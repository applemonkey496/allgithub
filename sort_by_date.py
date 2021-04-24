
import fileinput as fi
from datetime import datetime

def sort_function(date: str):
    parsed = ' '.join(date.split(' ', 2)[:2])
    return datetime.strptime(parsed, '%Y-%m-%d %H:%M')

lines = sorted(list(fi.input()), key=sort_function)

# Lines already have newline at the end
print(''.join(lines))
