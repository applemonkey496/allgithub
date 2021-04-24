
from os import path
from sys import argv

cred = argv[1].strip()
if cred[0] == '"':
    cred = cred[1:]
if cred[-1] == '"':
    cred = cred[:-1]

script_dir = path.dirname(path.realpath(__file__))
repos_file = path.join(script_dir, 'repos.txt')
# new_repos_file = path.join(script_dir, 'repos_formatted.txt')

replace_str = f'https://{cred}@github.com'

def replace(repo):
    return repo.replace(
        'git://github.com', 
        replace_str, 
        1
    )

with open(repos_file, 'r+') as f:
    repos = f.read().split('\n')
    repos = [replace(repo) for repo in repos]
    print('\n'.join(repos))

    f.truncate(0)
    f.write('\n'.join(repos))
