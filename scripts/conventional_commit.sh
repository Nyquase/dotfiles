#!/bin/bash

# Called after each gum call because I can't trap SIGINT
exit_if_error() {
  return_value=$?
  if [[ $return_value != 0 ]]; then
    exit $return_value
  fi
}

TYPE_LIST="feat
fix
hotfix
chore
ci
docs
style
refactor
perf
test"

TYPE=$(echo "$TYPE_LIST" | gum filter --indicator=">" --placeholder "Commit type")
exit_if_error

get_scope() {
  gum input --prompt "> $TYPE: " --placeholder "scope"
}

SCOPE=$(get_scope)
exit_if_error

while [ -z $SCOPE ]; do
  echo "You must input a scope"
  SCOPE=$(get_scope)
exit_if_error
done

SUMMARY=$(gum input --value "$TYPE($SCOPE): " --placeholder "Summary of this change")
exit_if_error

DESCRIPTION=$(gum write --placeholder "Details of this change (CTRL+D to finish)")
exit_if_error

gum confirm "Commit changes ?" && git commit -m "$SUMMARY" -m "$DESCRIPTION"
exit_if_error
