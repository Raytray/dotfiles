#!/bin/bash
# Status line derived from the oh-my-zsh "ray" theme
input=$(cat)
cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd')
model=$(echo "$input" | jq -r '.model.display_name')
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

dir="${cwd/#$HOME/~}"
branch=$(git -C "$cwd" --no-optional-locks symbolic-ref --short HEAD 2>/dev/null)
git_part=""
if [ -n "$branch" ]; then
  dirty=""
  [ -n "$(git -C "$cwd" --no-optional-locks status --porcelain 2>/dev/null)" ] && dirty="$(printf '\033[33m✗\033[0m')"
  git_part="$(printf '\033[1;34m(\033[31m%s\033[34m)\033[0m' "$branch")$dirty"
fi

printf '\033[36m%s\033[0m \033[1;32m%s\033[0m\033[32m@%s\033[36m%s\033[0m%s' \
  "$(date '+%H:%M:%S')" "$(whoami)" "$(hostname -s)" "$dir" "$git_part"
echo
printf '🤖 %s' "$model"
[ -n "$used" ] && printf ' | 📃 %.0f%%' "$used"
five=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
week=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')

five_reset=$(echo "$input" | jq -r '.rate_limits.five_hour.resets_at // empty')
week_reset=$(echo "$input" | jq -r '.rate_limits.seven_day.resets_at // empty')

if [ -n "$five" ]; then
  usage="⏱️ 5h:$(printf '%.0f' "$five")%"
  [ -n "$five_reset" ] && usage="$usage ↳↰ $(date -d "@$five_reset" '+%H:%M')"
else usage="⏱️ 5h:--"; fi
if [ -n "$week" ]; then
  usage="$usage | 📅 7d:$(printf '%.0f' "$week")%"
  [ -n "$week_reset" ] && usage="$usage ↳↰ $(date -d "@$week_reset" '+%a %-I%P')"
else usage="$usage | 📅 7d:--"; fi
printf ' | %s\n' "$usage"
