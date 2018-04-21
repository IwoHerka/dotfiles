import subprocess

config.load_autoconfig()

def read_xresources(prefix):
    props = {}
    x = subprocess.run(['xrdb', '-query', '~/.Xresources'], stdout=subprocess.PIPE)
    lines = x.stdout.decode().split('\n')
    for line in filter(lambda l : l.startswith(prefix), lines):
        prop, _, value = line.partition(':\t')
        props[prop] = value
    return props

xresources = read_xresources('*')

# Font settings
c.fonts.monospace = 'Menlo for Powerline'

# HTTP configuration
c.content.headers.accept_language = 'pl_PL,pl'
c.content.geolocation = False
c.content.media_capture = False

# Directories etc.
c.downloads.location.prompt = False
c.downloads.location.directory = '~/Downloads'
c.downloads.open_dispatcher = 'xdg-open'
c.downloads.position = 'bottom'

# Misc
c.completion.shrink = True
c.editor.command = ["st", "-e", "vim", "{}"]

# Tabs settings
c.tabs.favicons.show = False
c.tabs.indicator.width = 0

# Colors
c.colors.completion.fg = xresources['*foreground']
c.colors.completion.odd.bg = xresources['*background']
c.colors.completion.even.bg = xresources['*color7']
c.colors.completion.item.selected.fg = 'white'
c.colors.completion.item.selected.bg = xresources['*color3']
c.colors.completion.item.selected.border.top = xresources['*color7']
c.colors.completion.item.selected.border.bottom = xresources['*color7']
c.colors.completion.match.fg = xresources['*color5']
c.colors.completion.category.fg = xresources['*color10']
c.colors.completion.category.bg = xresources['*color7']
c.colors.completion.category.border.top = xresources['*background']
c.colors.completion.category.border.bottom = xresources['*color3']
c.colors.completion.scrollbar.fg = xresources['*color7']
c.colors.completion.scrollbar.bg = xresources['*background']

c.colors.downloads.error.fg = 'white'
c.colors.downloads.error.bg = xresources['*color1']
c.colors.downloads.start.fg = 'white'
c.colors.downloads.start.bg = xresources['*color4']
c.colors.downloads.stop.fg = 'white'
c.colors.downloads.stop.bg = xresources['*color2']

c.colors.messages.error.fg = 'white'
c.colors.messages.error.bg = xresources['*color1']
c.colors.messages.error.border = xresources['*color1']
c.colors.messages.warning.fg = 'white'
c.colors.messages.warning.bg = xresources['*color9']
c.colors.messages.warning.border = xresources['*color9']
c.colors.messages.info.fg = xresources['*foreground']
c.colors.messages.info.bg = xresources['*color7']
c.colors.messages.info.border = xresources['*color7']

c.colors.statusbar.normal.bg = xresources['*background']
c.colors.statusbar.normal.fg = xresources['*foreground']
c.colors.statusbar.command.fg = xresources['*foreground']
c.colors.statusbar.command.bg = xresources['*color7']
c.colors.statusbar.insert.fg = xresources['*color2']
c.colors.statusbar.insert.bg = xresources['*background']
c.colors.statusbar.caret.fg = xresources['*color5']
c.colors.statusbar.caret.bg = xresources['*background']
c.colors.statusbar.caret.selection.fg = xresources['*color6']
c.colors.statusbar.caret.selection.bg = xresources['*background']
c.colors.statusbar.passthrough.fg = xresources['*color13']
c.colors.statusbar.passthrough.bg = xresources['*background']

c.colors.statusbar.progress.bg = xresources['*foreground']
c.colors.statusbar.url.error.fg = xresources['*color1']
c.colors.statusbar.url.warn.fg = xresources['*color9']
c.colors.statusbar.url.success.http.fg = xresources['*foreground']
c.colors.statusbar.url.success.https.fg = xresources['*color2']
c.colors.statusbar.url.hover.fg = xresources['*color13']

c.colors.tabs.bar.bg = xresources['*background']
c.colors.tabs.odd.bg = xresources['*background']
c.colors.tabs.odd.fg = xresources['*foreground']
c.colors.tabs.even.bg = xresources['*background']
c.colors.tabs.even.fg = xresources['*foreground']
c.colors.tabs.selected.odd.fg = xresources['*foreground']
c.colors.tabs.selected.odd.bg = xresources['*color7']
c.colors.tabs.selected.even.fg = xresources['*foreground']
c.colors.tabs.selected.even.bg = xresources['*color7']

c.colors.prompts.bg = xresources['*background']
c.colors.prompts.fg = xresources['*foreground']
c.colors.prompts.border = '1px solid ' + xresources['*color9']
c.colors.prompts.selected.bg = xresources['*color7']

c.colors.downloads.bar.bg = xresources['*color7']

# Keybindings

# Rebind Alt to Mod4 (Windows). Alt is used by i3.
config.bind('<Mod4-1>', 'tab-focus 1', mode='normal')
config.bind('<Mod4-2>', 'tab-focus 2', mode='normal')
config.bind('<Mod4-3>', 'tab-focus 3', mode='normal')
config.bind('<Mod4-4>', 'tab-focus 4', mode='normal')
config.bind('<Mod4-5>', 'tab-focus 5', mode='normal')
config.bind('<Mod4-6>', 'tab-focus 6', mode='normal')
config.bind('<Mod4-7>', 'tab-focus 7', mode='normal')
config.bind('<Mod4-8>', 'tab-focus 8', mode='normal')
config.bind('<Mod4-9>', 'tab-focus 9', mode='normal')

# Switch : with ;.
config.bind(';', 'set-cmd-text :', mode='normal')
config.bind(':', 'hint images tab', mode='normal')

config.bind(';x', 'spawn nohup mpv {url}', mode='normal')
config.bind(';X', 'hint links spawn nohup mpv {hint-url}')
config.bind('<Ctrl+j>', 'completion-item-focus next', mode='command')
config.bind('<Ctrl+k>', 'completion-item-focus prev', mode='command')
config.bind('<Ctrl+Shift+p>', 'set content.private_browsing true ;; set-cmd-text -s :open -w ')
config.bind('<Ctrl+Shift+w>', 'set content.private_browsing false ;; close')
