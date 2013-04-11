#!/bin/sh
# Only after I wrote this did I realize that there was already a heroku CLI
# for app creation. Oh well; it didn't take long.

# Check dependencies
test -z $HEROKU_API_KEY && echo 'Set $HEROKU_API_KEY' && exit 1
if ! which jshon; then echo && echo 'Install jshon' && exit 1; fi
if ! which xmlstarlet; then echo && echo 'Install xmlstarlet' && exit 1; fi
set -e

# Global variables
APPGEN_URL="http://localhost:9393/"
app_seed=$RANDOM
tmp="/tmp/$app_seed"

# Choose an app name
app_name=$(curl "${APPGEN_URL}?seed=${app_seed}" | grep h1 "$tmp" | xmlstarlet sel -t -v '//h1'| tr -d \  )

# Make the app
curl -H "Accept: application/json" \
     -u ":$HEROKU_API_KEY" \
     -d "app[name]=$app_name" \
     -X POST https://api.heroku.com/apps

# Push the Ruby proxy to  the app
git_url=$(cat "$tmp" | jshon -e git_url -u)
(
  cd ruby-proxy
  git push "$git_url" master
)
