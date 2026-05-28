config.load_autoconfig()


c.tabs.show = 'always'
c.tabs.position = "left"
c.tabs.background = False

#c.window.transparent = True

c.session.lazy_restore = True

c.colors.webpage.darkmode.enabled = True


default_page = "~/.config/qutebrowser/index.html"
c.url.default_page = default_page
c.url.start_pages = default_page
c.url.searchengines = {
    'DEFAULT': 'https://www.startpage.com/do/dsearch?query={}',
    'dk': 'https://duckduckgo.com/?q={}', 
    'aw': 'https://wiki.archlinux.org/?search={}', 
    'go': 'https://www.google.com/search?q={}', 
    're': 'https://www.reddit.com/r/{}', 
    'ub': 'https://www.urbandictionary.com/define.php?term={}', 
    'wk': 'https://en.wikipedia.org/wiki/{}', 
    'yt': 'https://www.youtube.com/results?search_query={}'
}

c.fonts.default_family = '"IosevkaTerm Nerd Font"'

