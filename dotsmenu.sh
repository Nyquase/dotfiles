#!/bin/bash

    # This program is free software: you can redistribute it and/or modify
    # it under the terms of the GNU General Public License as published by
    # the Free Software Foundation, either version 3 of the License, or
    # (at your option) any later version.

    # This program is distributed in the hope that it will be useful,
    # but WITHOUT ANY WARRANTY; without even the implied warranty of
    # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    # GNU General Public License for more details.

    # You should have received a copy of the GNU General Public License
    # along with this program.  If not, see <http://www.gnu.org/licenses/>.

# A dmenu script to edit predefined files.
# Opens an editor to the file path.
# This implementation works with dotfiles. Could be arbitrary files.

# The full paths are manually included in a plain text file.
# One path per line, starting with the 'label' we want to display in the menu.
# Examples:
# Bspwm /home/USERNAME/.config/bspwm/bspwmrc
# Tmux Keybindings /home/USERNAME/.tmux/keybindings.conf

# XXX NOTE this is a working demo that is tailored to my custom setup
# PREREQUISITES
# All of my dotfiles (stow everything)
# https://github.com/protesilaos/dotfiles

# path to dotfiles index
# dotindex file must have the following format
#
# [[PathLabel] [Space]* [PathToFile] [\n]]*
#
mydotsindex="$HOME/.mydotsindex"

# define length of dotfiles' list (for use in dmenu -l)
mydotsindex_length=$(cat $mydotsindex | wc -l)

# gets the list with the file paths
# keeps only the first part which is the path's label
# that keeps the dmenu interface clean
mydotsindex_selection_clean ()
{
    sed -e 's,\(^[0-9A-Za-z ]*\) \([0-9A-Za-z/._]*\),\1,g' $mydotsindex | \
    dmenu -i -l $mydotsindex_length -p 'Edit dotfile'
}

# capture dmenu output
# match choice to the file path it references, exluding the label
mydotsindex_choice=$(grep -w "$(mydotsindex_selection_clean)" $mydotsindex | \
			 sed -e 's,\([0-9A-Za-z ]*\) \([0-9A-Za-z/._ ]*\),\2,g')

# open visual editor with path to selection
if [ "$mydotsindex_choice" ]; then
    termite --exec="emacsclient -nw $mydotsindex_choice"
fi
