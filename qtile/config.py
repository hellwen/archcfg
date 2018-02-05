
# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from libqtile.config import Key, Screen, Group, Drag, Click, Match
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook

mod = "mod4"

orange      = "#FFA500"
l_pink      = "#FFB6C1"
pink        = "#FFC0CB"
m_purple    = "#9370DB"
purple      = "#800080"
l_blue      = "#ADD8E6"
blue        = "#0000FF"
l_green     = "#32CD32"
green       = "#008000"
l_yellow    = "#FFFFE0"
yellow      = "#FFFF00"
glod        = "#FF7F50"
coral       = "#FF7F50"
l_coral     = "#F08080"
red         = "#FF0000"
brown       = "#A52A2A"
white       = "#FFFFFF"
l_gray      = "#D3D3D3"
gray        = "#808080"
black       = "#282828"

def app_or_group(group, app):
    def f(qtile):
        if qtile.groupMap[group].windows:
            qtile.groupMap[group].cmd_toscreen()
        else:
            qtile.groupMap[group].cmd_toscreen()
            qtile.cmd_spawn(app)
    return f

def screenshot(save=True, copy=True):
    def f(qtile):
        path = Path.home() / 'images'
        path /= f'screenshot_{str(int(time() * 100))}.png'
        shot = subprocess.run(['scrot -s'], stdout=subprocess.PIPE)

        if save:
            with open(path, 'wb') as sc:
                sc.write(shot.stdout)

        if copy:
            subprocess.run(['xclip', '-selection', 'clipboard', '-t',
                            'image/png'], input=shot.stdout)
    return f

def backlight(action):
    def f(qtile):
        brightness = int(subprocess.run(['xbacklight', '-get'],
                                        stdout=subprocess.PIPE).stdout)
        if brightness != 1 or action != 'dec':
            if (brightness > 49 and action == 'dec') \
                                or (brightness > 39 and action == 'inc'):
                subprocess.run(['xbacklight', f'-{action}', '10',
                                '-fps', '10'])
            else:
                subprocess.run(['xbacklight', f'-{action}', '1'])
    return f

keys = [
    # Switch between screens
    Key([mod], "1", lazy.to_screen(0)),
    Key([mod], "2", lazy.to_screen(1)),
    Key([mod], "3", lazy.to_screen(2)),

    # Switch between windows in current stack pane
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "k", lazy.layout.up()),
    Key([mod], "l", lazy.layout.right()),

    Key([mod, "shift"], "h", lazy.layout.swap_left()),
    Key([mod, "shift"], "l", lazy.layout.swap_right()),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),

    # Key([mod], "Return", lazy.spawn("urxvt -fg lightgray -bg black -tr -tint lightgray -sh 40")),
    Key([mod], "Return", lazy.spawn("xterm")),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout()),
    Key([mod], "space", lazy.next_layout()),

    Key([mod], "w", lazy.window.kill()),

    Key([mod, "control"], "r", lazy.restart()),
    Key([mod, "control"], "q", lazy.shutdown()),

    Key([mod], "r", lazy.spawncmd()),

    # add volume control
    Key([mod, "control"], "k", lazy.spawn("amixer -c 0 -q set Master 2dB+")),
    Key([mod, "control"], "j", lazy.spawn("amixer -c 0 -q set Master 2dB-")),
    # lock screen
    Key([mod, "control"], "l", lazy.spawn("i3lock -i /home/arch/.archcfg/lock.png")),
    # Short Key by hellwen.wu
    # Key([mod, "control"], "b", lazy.spawn("google-chrome-stable")),
    Key([mod, "control"], "p", lazy.spawn("xterm ranger")),
    Key([mod, "control"], "m", lazy.spawn("scrot")),
    Key([mod], "b", lazy.function(app_or_group("www", "google-chrome-stable"))),

    Key([mod], "z", lazy.window.toggle_floating()),
    #Key([mod], "n", lazy.window.toggle_minimize()),
    #Key([mod], "m", lazy.window.toggle_maximize()),

    Key([mod], "i", lazy.layout.grow()),
    Key([mod], "o", lazy.layout.shrink()),
    Key([mod], "n", lazy.layout.normalize()),
    Key([mod], "m", lazy.layout.maximize()),
]

myMonadTall = layout.MonadTall(
    border_focus=l_gray,
    border_width=1
)

floating_layout = layout.Floating(
    border_focus=l_gray,
    border_width=1
)

myWindows = {
    'a': {
        'matches': None,
        'layouts': [myMonadTall, layout.Max()]
    },
    's': {
        'matches': None,
        'layouts': [myMonadTall, layout.Max()]
    },
    "d": {
        'matches': None,
        'layouts': [myMonadTall, layout.Max()]
    },
    "f": {
        'matches': None,
        'layouts': [myMonadTall, layout.Max()]
    },
}

groups = [Group(i, layouts=myWindows[i]['layouts'], matches=myWindows[i]['layouts']) for i in myWindows]

for i in groups:
    # mod1 + letter of group = switch to group
    keys.append(
        Key([mod], i.name, lazy.group[i.name].toscreen())
    )

    # mod1 + shift + letter of group = switch to & move focused window to group
    keys.append(
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name))
    )

groups.extend([
    Group('www', layouts=[layout.Max()]),
])

widget_defaults = dict(
    font='Arial',
    fontsize=16,
    padding=3,
)


main_bar = bar.Bar(
        [
            widget.CurrentScreen(
                active_text="Arch",
                inactive_text="-",
            ),
            widget.GroupBox(
                background=l_blue,
                foreground=black,
                center_aligned=True,
                highlight_color=[red, 'ffffff'],
                highlight_method="line",
            ),
            widget.CurrentLayout(
                background=l_gray,
                foreground=black
            ),
            widget.Prompt(
                background=yellow,
                foreground=gray,
                padding=0
            ),
            widget.TextBox(
                text=u"[",
                background=black,
                foreground=gray,
                padding=0
            ),
            widget.WindowName(
                background=black,
                foreground=white
            ),
            widget.TextBox(
                text=u"]",
                background=black,
                foreground=white,
                padding=0
            ),
            widget.TextBox("C", background=black, foreground=white),
            widget.CPUGraph(border_width=0, line_width=1, background=black),

            widget.TextBox("M", background=black, foreground=white),
            widget.MemoryGraph(border_width=0, line_width=1, background=black),

            # widget.TextBox('B:', background=orange, foreground=black),
            widget.Battery(background=orange, foreground=black),

            # widget.TextBox('V:', background=l_green, foreground=black),
            widget.Volume(background=l_green, foreground=black),

            # widget.LaunchBar(progs=('chrome', 'google-chrome-stable', 'logout from qtile'))

            widget.Clock(
                format=u'%Y-%m-%d %H:%M',
                background=m_purple,
                foreground=black
            ),
            widget.Systray(
                background=black
            ),
        ], 25)

screens = [Screen(top=main_bar), Screen(), Screen()]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
        start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
        start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []
main = None
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, github issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"

def main(qtile):
    qtile.cmd_warning()
