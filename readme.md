AppGen DevOps
======
AppGen generates random NYC Big Apps. All apps are served from one Sinatra
instance, with a seed specifying a particular app. In order to hide that these
are all the same apps, we are proxying them through various cloudsourced web
services. Specifically, we're using

* Heroku ([API documentation](https://api-docs.heroku.com))
* NearlyFreeSpeech ([API documentation](https://members.nearlyfreespeech.net/wiki/API/Introduction))
* Google AppEngine ([confusing](https://appengine.google.com) [documentation](https://developers.google.com/appengine/docs/adminconsole/index))
* Nodejitsu [API documentation](https://www.nodejitsu.com/documentation/api/)
