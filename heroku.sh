#!/bin/sh
# Only after I wrote this did I realize that there was already a heroku CLI
# for app creation. Oh well; it didn't take long.

# Check dependencies
test -z $HEROKU_API_KEY && echo 'Set $HEROKU_API_KEY' && exit 1
if ! which jshon; then echo && echo 'Install jshon' && exit 1; fi
if ! which xmlstarlet; then echo && echo 'Install xmlstarlet' && exit 1; fi
set -e

# Set app seed.
app_seed=$RANDOM

# Global variables
APPGEN_URL="http://appgen.herokuapp.com"
tmp="/tmp/$app_seed"

# Choose an app name
wget -O "$tmp" "${APPGEN_URL}?seed=${app_seed}"
app_name=$(grep h1 "$tmp" | xmlstarlet sel -t -v '//h1'| tr -d \  | tr [A-Z] [a-z])

# Make the app
curl -H "Accept: application/json" \
     -u ":$HEROKU_API_KEY" \
     -d "app[name]=$app_name" \
     -X POST https://api.heroku.com/apps > "$tmp"

# Push the Ruby proxy to  the app
git_url=$(cat "$tmp" | jshon -e git_url -u)

(
  set -e
  cd heroku-proxy-flask
  sed -i "s/##seed##/$app_seed/" app.py
  git commit . -m set\ seed
  git push "$git_url" master --force
  git reset --hard HEAD^
)

echo The random app is at "http://${appname}.herokuapp.com"
