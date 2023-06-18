# Firefox


## Addons
see `~/bookmarks/addons-firefox.md`


## Theme
- [Dark](https://addons.mozilla.org/en-US/firefox/addon/nicothin-dark-theme/) – true gray dark theme


## about:config

### don't trigger menu-focus on pressing alt
`ui.key.menuAccessKeyFocuses` = false

### block auto-refresh/-redirects
> i.e. appstore
`accessibility.blockautorefresh` = frue

### tweak cache sizes
whichever of `browser.cache.` looks too small (in MB)

### allow use of userChrome.css
> to customize browser-window look
`toolkit.legacyUserProfileCustomizations.stylesheets` = true

### compact ui theme
`browser.uidensity` = 1

### Hi-Dpi correction
> so 100% zoom would closer match with monitor resolution (measured by `window.innerWidth`)
`layout.css.devPixelsPerPx` = 1.75

### enable css [backdrop-filter](https://developer.mozilla.org/en-US/docs/Web/CSS/backdrop-filter#browser_compatibility)
- `gfx.webrender.enabled` = true
- `gfx.webrender.all` = true
- `layout.css.backdrop-filter.enabled` = true

### enable WebGL
- `webgl.disabled` = false
- `webgl.force-enabled` = true

### disable [Ctrl+Q]
- `browser.quitShortcut.disabled` = true


## Cookies

### always-block
- `medium.com`


## address bar

### only show latin letters in domain names (add `xn--` otherwise)
- `network.IDN_show_punycode` = true
