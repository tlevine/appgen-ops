#!/bin/sh
test -z $HEROKU_API_KEY && echo 'Set $HEROKU_API_KEY' && exit 1
set -e

app_name=chainsaw

curl -H "Accept: application/json" \
     -u ":$HEROKU_API_KEY" \
     -d "app[name]=$app_name" \
     -X POST https://api.heroku.com/apps
