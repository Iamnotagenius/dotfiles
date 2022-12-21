import subprocess
#HINT GROUPS
with config.pattern('*://youtube.com/') as y:
	y.hints.selectors['thumbnails'] = ['#thumbnail']

def read_xresources(prefix):
    props = {}
    x = subprocess.run(['xrdb', '-query'], stdout=subprocess.PIPE)
    lines = x.stdout.decode().split('\n')
    for line in filter(lambda l : l.startswith(prefix), lines):
        prop, _, value = line.partition(':\t')
        props[prop] = value
    return props
c.url.searchengines = {
    'DEFAULT': 'https://duckduckgo.com/?q={}', 
    'aw': 'https://wiki.archlinux.org/?search={}', 
    're': 'https://www.reddit.com/r/{}', 
    'ub': 'https://www.urbandictionary.com/define.php?term={}', 
    'wiki': 'https://en.wikipedia.org/wiki/{}', 
    'yt': 'https://www.youtube.com/results?search_query={}',
    'ozon': 'https://www.ozon.ru/search/?from_global=true&text={}',
    'gh': 'https://www.github.com/search?q={}',
    'cd': 'https://dictionary.cambridge.org/dictionary/english-russian/{}'
}
config.load_autoconfig('*')
config.source('qutebrowser-themes/themes/onedark.py')
