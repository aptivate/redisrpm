# redisrpm

Build RPMs for [Redis] with [fpm].

[Redis]: https://redis.io/
[fpm]: http://fpm.readthedocs.io/

Since the Redis project doesn't release ready to use RPMs, we need to provide
them ourselves. This is simple with [wirbelsturm-rpm-redis]. We've got a Docker
setup ready for you.

[wirbelsturm-rpm-redis]: https://github.com/miguno/wirbelsturm-rpm-redis

Just pick your version of Redis and run:

```bash
$ VERSION=4.0.0 make redisrpm
```

This should pop out a fresh new Redis RPM in the current working directory.

Happy Hacking.
