% Environnement Java 8
% Didier Richard
% rév. 0.0.1 du 02/11/2016

---

# Building #

```bash
$ docker build -t dgricci/alpine-java:0.0.1 -t dgricci/alpine-java:latest .
```

## Behind a proxy (e.g. 10.0.4.2:3128) ##

```bash
$ docker build \
    --build-arg http_proxy=http://10.0.4.2:3128/ \
    --build-arg https_proxy=http://10.0.4.2:3128/ \
    -t dgricci/alpine-java:0.0.1 -t dgricci/alpine-java:latest .
```

# Use #

See `dgricci/alpine` README for handling permissions with dockers volumes.

```bash
$ docker run -it --rm -e USER_ID=$UID -e USER_NAME=$USER dgricci/alpine-java java -version
openjdk version "1.8.0_92-internal"
OpenJDK Runtime Environment (build 1.8.0_92-internal-alpine-r1-b14)
OpenJDK 64-Bit Server VM (build 25.92-b14, mixed mode)
```

__Et voilà !__


_fin du document[^pandoc_gen]_

[^pandoc_gen]: document généré via $ `pandoc -V fontsize=10pt -V geometry:"top=2cm, bottom=2cm, left=1cm, right=1cm" -s -N --toc -o java.pdf README.md`{.bash}
