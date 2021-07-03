# Padavan-ng Builder

This Makefile/Dockerfile is created with the objective to build
[padavan-ng](https://gitlab.com/dm38/padavan-ng) firmware inside Docker, making
it easier to build without chasing all the dependencies, and also avoiding usage
of insecure scripts like
[Prometheus](http://prometheus.freize.net/)<sup>1</sup>. It doesn't has all the
features from Prometheus neither (e.g.: extra themes), and it doesn't meant to
be: those scripts are meant to be as simple as it can be.

To use them, make sure you have `docker` installed and your user has permission
to run `docker` commands (or run the commands with `sudo`, not a great idea but
your choice) Afterwards, just run:

```
$ make clean && make
```

The `make clean` is only necessary for subsequent builds: since the repository
is hardcoded on the `Dockerfile` you may build an outdated version of the
firmware if you don't run `make clean` first.

<sup>1</sup>: Prometheus is a complex shell script that downloads some files
using HTTP. While it doesn't seem malicious, it is quite easy to introduce some
kinda of backdoor using it.
