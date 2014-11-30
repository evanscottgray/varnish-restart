varnish-restart
========

Restart varnish on a remote system via a web ui... very web 2.0, such synergy.

Needs ssh keys to work.

### Deploy
1. `docker build --rm=true --tag="varnish-restart/dev" ./`
2. `docker run -d -p 80 varnish-restart/dev:latest`
