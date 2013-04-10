AppGen DevOps
======

## Hosting
AppGen generates random NYC Big Apps. All apps are served from one Sinatra
instance, with a seed specifying a particular app. In order to hide that these
are all the same apps, we are proxying them through various cloudsourced web
services. Specifically, we're using

* Heroku ([API documentation](https://api-docs.heroku.com))
* NearlyFreeSpeech ([API documentation](https://members.nearlyfreespeech.net/wiki/API/Introduction))
* Google AppEngine
  * [AppEngine site](https://appengine.google.com)
  * [Bad documentation](https://developers.google.com/appengine/docs/adminconsole/index)
  * [Tutorial](http://www.labnol.org/internet/setup-proxy-server/12890/)
* Nodejitsu [API documentation](https://www.nodejitsu.com/documentation/api/)

Here are some [other ideas](http://www.quora.com/Is-there-anything-like-Heroku-I-can-use-for-a-PHP-site).

## Facebook accounts
You need a facebook account to submit something on CollabFinder. You can submit
multiple apps, so the AppGen team could just submit all of the apps, but the
city might catch on. Instead, we're going to tell other people to submit the
apps for us. In case that doesn't work, we can also consider buying Facebook
accounts. Here are some vendors.

* https://buyaccs.com/en/
* http://amazingdevelopers.com/idsforsale/facebook-pva/
* http://www.dataentryassistant.com/order-services/social-media-accounts/facebook-accounts.html

## Proxy server

* [php-simple-proxy](http://benalman.com/projects/php-simple-proxy/) ([code](https://raw.github.com/cowboy/php-simple-proxy/master/ba-simple-proxy.php))
