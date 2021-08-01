import subprocess

def read_xresources(prefix):
    props = {}
    x = subprocess.run(['xrdb', '-query'], stdout=subprocess.PIPE)
    lines = x.stdout.decode().split('\n')
    for line in filter(lambda l : l.startswith(prefix), lines):
        prop, _, value = line.partition(':\t')
        props[prop] = value
    return props

config.load_autoconfig('*')

xresources = read_xresources('')
# HINT COLORS
c.colors.hints.bg = xresources['*.background']
c.colors.hints.fg = xresources['*.color3']
c.colors.hints.match.fg = xresources['*.color2']
# COMPLETION WIDGET
c.colors.completion.category.bg = xresources['*.color5']
c.colors.completion.category.border.top = xresources['*.color5']
c.colors.completion.category.border.bottom = xresources['*.color5']
c.colors.completion.category.fg = xresources['*.color0']

c.colors.completion.even.bg = xresources['*.color0']
c.colors.completion.odd.bg = xresources['*.color0']

c.colors.completion.fg = xresources['*.foreground']
c.colors.completion.match.fg = xresources['*.color2']

c.colors.completion.item.selected.fg = xresources['*.color0']
c.colors.completion.item.selected.match.fg = xresources['*.color2']

c.colors.completion.item.selected.bg = xresources['*.color8']
c.colors.completion.item.selected.border.bottom = xresources['*.color8']
c.colors.completion.item.selected.border.top = xresources['*.color8']
# STATUSBAR
c.colors.statusbar.normal.bg = xresources['*.background']
c.colors.statusbar.normal.fg = xresources['*.foreground']

c.colors.statusbar.command.bg = xresources['*.background']
c.colors.statusbar.caret.bg = xresources['*.background']

c.colors.statusbar.command.fg = xresources['*.foreground']
c.colors.statusbar.caret.fg = xresources['*.color3']

c.colors.statusbar.caret.selection.bg = xresources['*.color5']
c.colors.statusbar.caret.selection.fg = xresources['*.background']

c.colors.statusbar.insert.bg = xresources['*.color2']
c.colors.statusbar.insert.fg = xresources['*.color0']

c.colors.statusbar.url.success.http.fg = xresources['*.foreground']
c.colors.statusbar.url.success.https.fg = xresources['*.color2']
c.colors.statusbar.url.error.fg = xresources['*.color1']
c.colors.statusbar.url.warn.fg = xresources['*.color3']
c.colors.statusbar.url.hover.fg = xresources['*.color6']

# TAB BAR
c.colors.tabs.bar.bg = xresources['*.background']

c.colors.tabs.even.bg = xresources['*.foreground']
c.colors.tabs.even.fg = xresources['*.background']

c.colors.tabs.odd.bg = xresources['*.foreground']
c.colors.tabs.odd.fg = xresources['*.background']


c.colors.tabs.indicator.error = xresources['*.color1']

c.colors.tabs.selected.even.bg = xresources['*.color0']
c.colors.tabs.selected.odd.bg = xresources['*.color0']

c.colors.tabs.selected.even.fg = xresources['*.color7']
c.colors.tabs.selected.odd.fg = xresources['*.color7']

c.colors.tabs.pinned.even.bg = xresources['*.color6']
c.colors.tabs.pinned.odd.bg = xresources['*.color6']

c.colors.tabs.pinned.even.fg = xresources['*.color0']
c.colors.tabs.pinned.odd.fg = xresources['*.color0']

c.colors.tabs.pinned.selected.even.bg = xresources['*.color2']
c.colors.tabs.pinned.selected.odd.bg = xresources['*.color2']

c.colors.tabs.pinned.selected.even.fg = xresources['*.color0']
c.colors.tabs.pinned.selected.odd.fg = xresources['*.color0']

c.colors.completion.scrollbar.fg = xresources['*.background']
c.colors.completion.scrollbar.bg = xresources['*.background']

# KEY HINTS
c.colors.keyhint.bg = xresources['*.background']
c.colors.keyhint.fg = xresources['*.foreground']
c.colors.keyhint.suffix.fg = xresources['*.color3']
# DOWNLOAD BAR
c.colors.downloads.bar.bg = xresources['*.background']
c.colors.downloads.error.bg = xresources['*.color1']
c.colors.downloads.error.fg = xresources['*.foreground']

c.colors.downloads.start.bg = xresources['*.color4']
c.colors.downloads.stop.bg = xresources['*.color2']


c.colors.downloads.start.fg = xresources['*.background']
c.colors.downloads.stop.fg = xresources['*.background']
# MESSAGES
c.colors.messages.error.bg = xresources['*.color1']
c.colors.messages.error.border = xresources['*.color1']
c.colors.messages.error.fg = xresources['*.background']

c.colors.messages.info.bg = xresources['*.color4']
c.colors.messages.info.border = xresources['*.color4']
c.colors.messages.info.fg = xresources['*.background']

c.colors.messages.warning.bg = xresources['*.color3']
c.colors.messages.warning.border = xresources['*.color3']
c.colors.messages.warning.fg = xresources['*.background']
# PROMPTS
c.colors.prompts.bg = xresources['*.background']
c.colors.prompts.border = xresources['*.background']
c.colors.prompts.fg = xresources['*.foreground']

c.colors.prompts.bg = xresources['*.background']
c.colors.prompts.border = xresources['*.background']
c.colors.prompts.fg = xresources['*.foreground']

c.colors.prompts.selected.bg = xresources['*.foreground']
c.colors.prompts.selected.fg = xresources['*.background']
