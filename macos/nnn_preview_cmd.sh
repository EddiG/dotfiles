# Check FIFO
NNN_FIFO=${NNN_FIFO:-$1}
if [ ! -r "$NNN_FIFO" ]; then
  echo "Unable to open \$NNN_FIFO='$NNN_FIFO'" | less
  exit 2
fi

# Read selection from $NNN_FIFO
while read -r selection; do
  clear
  lines=$(($(tput lines) - 1))
  cols=$(tput cols)

  # Print directory tree
  if [ -d "$selection" ]; then
    cd "$selection" || continue
    tree --all-files --dirs-first --trailing-slash --exclude "node_modules|.git" --max-depth 2 | head -n $lines | cut -c 1-"$cols"
    continue
  fi

  # Print file head
  if [ -f "$selection" ]; then
    bat --plain --paging=never --color=always --style=numbers --line-range=:$lines "$selection"
    # head -n $lines "$selection" | cut -c 1-"$cols"
    continue
  fi

  # Something went wrong
  echo "Unknown type: '$selection'"
done <"$NNN_FIFO"
