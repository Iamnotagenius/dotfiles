import subprocess
#HINT GROUPS
with config.pattern('*://youtube.com/') as y:
	y.hints.selectors['thumbnails'] = ['#thumbnail']

c.url.searchengines = {
    'DEFAULT': 'https://duckduckgo.com/?q={}', 
    'aw': 'https://wiki.archlinux.org/?search={}', 
    're': 'https://www.reddit.com/r/{}', 
    'ub': 'https://www.urbandictionary.com/define.php?term={}', 
    'wiki': 'https://en.wikipedia.org/wiki/{}', 
    'yt': 'https://www.youtube.com/results?search_query={}',
    'ozon': 'https://www.ozon.ru/search/?from_global=true&text={}',
    'gh': 'https://github.com/search?utf8=%E2%9C%93&q={}',
    'cd': 'https://dictionary.cambridge.org/dictionary/english-russian/{}',
    'cpp': 'https://en.cppreference.com/mwiki/index.php?title=Special:Search&search={}',
    'pd': 'https://www.protondb.com/search?q={}',
    'tpb': 'https://thepiratebay10.org/search/{}',
    'rt': 'https://rutracker.org/forum/tracker.php?nm={}'
}

config.load_autoconfig('*')
c.content.canvas_reading=True
c.editor.command = ["neovide", "{file}", "+{line}"]
config.source('themes/themes/onedark.py')
