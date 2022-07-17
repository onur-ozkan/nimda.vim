def init(c, options = {}):
    palette = {
        'dark-0': '#191919',
        'dark-1': '#212121',
        'gray-0': '#616161',
        'gray-1': '#818181',
        'gray-2': '#dddddd',
        'white': '#f8f8f2',
        'dirty-white': '#eeeeee',
        'dark-yellow': '#f7ca88',
        'red-0': '#992f33',
        'red-1': '#d75f5f',
        'green': '#87af5f',
        'blue': '#8197bf',
        'purple': '#a293cb'
    }

    spacing = options.get('spacing', {
        'vertical': 5,
        'horizontal': 5
    })

    padding = options.get('padding', {
        'top': spacing['vertical'],
        'right': spacing['horizontal'],
        'bottom': spacing['vertical'],
        'left': spacing['horizontal']
    })

    ## Background color of the completion widget category headers.
    c.colors.completion.category.bg = palette['dark-0']

    ## Bottom border color of the completion widget category headers.
    c.colors.completion.category.border.bottom = palette['dark-0']

    ## Top border color of the completion widget category headers.
    c.colors.completion.category.border.top = palette['dark-0']

    ## Foreground color of completion widget category headers.
    c.colors.completion.category.fg = palette['white']

    ## Background color of the completion widget for even rows.
    c.colors.completion.even.bg = palette['dark-0']

    ## Background color of the completion widget for odd rows.
    c.colors.completion.odd.bg = palette['dark-1']

    ## Text color of the completion widget.
    c.colors.completion.fg = palette['dirty-white']

    ## Background color of the selected completion item.
    c.colors.completion.item.selected.bg = palette['blue']

    ## Bottom border color of the selected completion item.
    c.colors.completion.item.selected.border.bottom = palette['blue']

    ## Top border color of the completion widget category headers.
    c.colors.completion.item.selected.border.top = palette['blue']

    ## Foreground color of the selected completion item.
    c.colors.completion.item.selected.fg = palette['dark-1']

    ## Foreground color of the matched text in the completion.
    c.colors.completion.match.fg = palette['blue']

    # Foreground color of the matched text in the selected completion item.
    c.colors.completion.item.selected.match.fg = palette['dark-1']

    ## Color of the scrollbar in completion view
    c.colors.completion.scrollbar.bg = palette['dark-0']

    ## Color of the scrollbar handle in completion view.
    c.colors.completion.scrollbar.fg = palette['white']

    ## Background color for the download bar.
    c.colors.downloads.bar.bg = palette['dark-0']

    ## Background color for downloads with errors.
    c.colors.downloads.error.bg = palette['dark-0']

    ## Foreground color for downloads with errors.
    c.colors.downloads.error.fg = palette['red-1']

    ## Color gradient stop for download backgrounds.
    c.colors.downloads.stop.bg = palette['dark-0']

    ## Color gradient interpolation system for download backgrounds.
    ## Type: ColorSystem
    ## Valid values:
    ##   - rgb: Interpolate in the RGB color system.
    ##   - hsv: Interpolate in the HSV color system.
    ##   - hsl: Interpolate in the HSL color system.
    ##   - none: Don't show a gradient.
    c.colors.downloads.system.bg = 'none'

    ## Background color for hints. Note that you can use a `rgba(...)` value
    ## for transparency.
    c.colors.hints.bg = palette['dark-0']

    ## Font color for hints.
    c.colors.hints.fg = palette['purple']

    ## Hints
    c.hints.border = '1px solid ' + palette['dark-1']

    ## Font color for the matched part of hints.
    c.colors.hints.match.fg = palette['dirty-white']

    ## Background color of the keyhint widget.
    c.colors.keyhint.bg = palette['dark-0']

    ## Text color for the keyhint widget.
    c.colors.keyhint.fg = palette['purple']

    ## Highlight color for keys to complete the current keychain.
    c.colors.keyhint.suffix.fg = palette['gray-1']

    ## Background color of an error message.
    c.colors.messages.error.bg = palette['dark-0']

    ## Border color of an error message.
    c.colors.messages.error.border = palette['dark-1']

    ## Foreground color of an error message.
    c.colors.messages.error.fg = palette['red-1']

    ## Background color of an info message.
    c.colors.messages.info.bg = palette['dark-0']

    ## Border color of an info message.
    c.colors.messages.info.border = palette['dark-1']

    ## Foreground color an info message.
    c.colors.messages.info.fg = palette['blue']

    ## Background color of a warning message.
    c.colors.messages.warning.bg = palette['dark-0']

    ## Border color of a warning message.
    c.colors.messages.warning.border = palette['dark-1']

    ## Foreground color a warning message.
    c.colors.messages.warning.fg = palette['red-1']

    ## Background color for prompts.
    c.colors.prompts.bg = palette['dark-0']

    # ## Border used around UI elements in prompts.
    c.colors.prompts.border = '1px solid ' + palette['dark-1']

    ## Foreground color for prompts.
    c.colors.prompts.fg = palette['blue']

    ## Background color for the selected item in filename prompts.
    c.colors.prompts.selected.bg = palette['gray-1']

    ## Background color of the statusbar in caret mode.
    c.colors.statusbar.caret.bg = palette['dark-1']

    ## Foreground color of the statusbar in caret mode.
    c.colors.statusbar.caret.fg = palette['dark-yellow']

    ## Background color of the statusbar in caret mode with a selection.
    c.colors.statusbar.caret.selection.bg = palette['dark-1']

    ## Foreground color of the statusbar in caret mode with a selection.
    c.colors.statusbar.caret.selection.fg = palette['dark-yellow']

    ## Background color of the statusbar in command mode.
    c.colors.statusbar.command.bg = palette['purple']

    ## Foreground color of the statusbar in command mode.
    c.colors.statusbar.command.fg = palette['dark-0']

    ## Background color of the statusbar in private browsing + command mode.
    c.colors.statusbar.command.private.bg = palette['dark-0']

    ## Foreground color of the statusbar in private browsing + command mode.
    c.colors.statusbar.command.private.fg = palette['dirty-white']

    ## Background color of the statusbar in insert mode.
    c.colors.statusbar.insert.bg = palette['green']

    ## Foreground color of the statusbar in insert mode.
    c.colors.statusbar.insert.fg = palette['dark-0']

    ## Background color of the statusbar.
    c.colors.statusbar.normal.bg = palette['dark-1']

    ## Foreground color of the statusbar.
    c.colors.statusbar.normal.fg = palette['dirty-white']

    ## Background color of the statusbar in passthrough mode.
    c.colors.statusbar.passthrough.bg = palette['dark-0']

    ## Foreground color of the statusbar in passthrough mode.
    c.colors.statusbar.passthrough.fg = palette['dark-yellow']

    ## Background color of the statusbar in private browsing mode.
    c.colors.statusbar.private.bg = palette['dark-1']

    ## Foreground color of the statusbar in private browsing mode.
    c.colors.statusbar.private.fg = palette['dirty-white']

    ## Background color of the progress bar.
    c.colors.statusbar.progress.bg = palette['dark-0']

    ## Foreground color of the URL in the statusbar on error.
    c.colors.statusbar.url.error.fg = palette['red-1']

    ## Default foreground color of the URL in the statusbar.
    c.colors.statusbar.url.fg = palette['white']

    ## Foreground color of the URL in the statusbar for hovered links.
    c.colors.statusbar.url.hover.fg = palette['blue']

    ## Foreground color of the URL in the statusbar on successful load
    c.colors.statusbar.url.success.http.fg = palette['blue']

    ## Foreground color of the URL in the statusbar on successful load
    c.colors.statusbar.url.success.https.fg = palette['blue']

    ## Foreground color of the URL in the statusbar when there's a warning.
    c.colors.statusbar.url.warn.fg = palette['dark-yellow']

    ## Status bar padding
    c.statusbar.padding = padding

    ## Background color of the tab bar.
    ## Type: QtColor
    c.colors.tabs.bar.bg = palette['gray-0']

    ## Background color of unselected even tabs.
    ## Type: QtColor
    c.colors.tabs.even.bg = palette['gray-0']

    ## Foreground color of unselected even tabs.
    ## Type: QtColor
    c.colors.tabs.even.fg = palette['white']

    ## Color for the tab indicator on errors.
    ## Type: QtColor
    c.colors.tabs.indicator.error = palette['red-1']

    ## Color gradient start for the tab indicator.
    ## Type: QtColor
    c.colors.tabs.indicator.start = palette['dark-yellow']

    ## Color gradient end for the tab indicator.
    ## Type: QtColor
    c.colors.tabs.indicator.stop = palette['green']

    ## Color gradient interpolation system for the tab indicator.
    ## Type: ColorSystem
    ## Valid values:
    ##   - rgb: Interpolate in the RGB color system.
    ##   - hsv: Interpolate in the HSV color system.
    ##   - hsl: Interpolate in the HSL color system.
    ##   - none: Don't show a gradient.
    c.colors.tabs.indicator.system = 'none'

    ## Background color of unselected odd tabs.
    ## Type: QtColor
    c.colors.tabs.odd.bg = palette['gray-0']

    ## Foreground color of unselected odd tabs.
    ## Type: QtColor
    c.colors.tabs.odd.fg = palette['white']

    # ## Background color of selected even tabs.
    # ## Type: QtColor
    c.colors.tabs.selected.even.bg = palette['dark-1']

    # ## Foreground color of selected even tabs.
    # ## Type: QtColor
    c.colors.tabs.selected.even.fg = palette['white']

    # ## Background color of selected odd tabs.
    # ## Type: QtColor
    c.colors.tabs.selected.odd.bg = palette['dark-1']

    # ## Foreground color of selected odd tabs.
    # ## Type: QtColor
    c.colors.tabs.selected.odd.fg = palette['white']

    ## Tab padding
    c.tabs.padding = padding
    c.tabs.indicator.width = 1
    c.tabs.favicons.scale = 1
