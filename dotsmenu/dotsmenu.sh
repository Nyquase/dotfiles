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
# One path per line, starting with the 'label' we want to display in the menu,
# followed by a '=' then the path to the file you want to open
# The file must have the following format :
#
# Examples:
# Bspwm=/home/USERNAME/.config/bspwm/bspwmrc
# Tmux Keybindings=/home/USERNAME/.tmux/keybindings.conf

# Path to dotfiles index
if [ $# -eq 0 ];  then
    mydotsindex="$HOME/.mydotsindex"
else
    mydotsindex="$1"
fi

# Define length of dotfiles' list (for use in dmenu -l)
mydotsindex_length=$(cat $mydotsindex | wc -l)

# Gets the list with the file paths
# Keeps only the first part which is the path's label
# that keeps the dmenu interface clean
split_regex='\([^=]*\)=\(.*\)'
mydotsindex_selection()
{
	sed -e 's,'$split_regex',\1,g' $mydotsindex | \
	    dmenu -i -l $mydotsindex_length -p 'Edit dotfile'
}

# Capture dmenu output
# Match choice to the file path it references, exluding the label
choice=$(mydotsindex_selection)

# User pressed Escape : empty string
if [ -z "$choice" ]; then
    exit 1
fi

file=$(grep -w "$choice=" $mydotsindex | \
			 sed -e 's,'$split_regex',\2,g')

file="${file/#\~/$HOME}"

# open visual editor with path to selection
if [ -f "$file" ]; then
    alacritty -e nvim "$file"
else
    echo $file
    echo $choice
    exit 1
#    termite --hold --exec="echo \"File not found\""&
#    shell_pid=$!
#    sleep 3
#    kill -KILL $shell_pid
fi
