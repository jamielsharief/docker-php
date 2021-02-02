# Building manually using Manifest

Log into docker

```bash
$ docker login
```

Build locally (ARM)

```bash
$ docker build -t jamielsharief/php:arm64 --build-arg ARCH=arm64/ .
$ docker push jamielsharief/php:arm64
```


In the next step you need to use a docker feature called Mainfest, this requires the experimental features to be enabled, you can set 

```bash
$ export DOCKER_CLI_EXPERIMENTAL=enabled
```

Create a manifest and upload.  You will need to download missing tags `docker pull <image>`, since the above building method only builds for the current architecture.

```bash
$ docker manifest create \
          jamielsharief/php:latest \
          --amend jamielsharief/php:arm64
```

```bash
$ docker manifest create \
          jamielsharief/php:latest \
          --amend jamielsharief/php:amd64 \
          --amend jamielsharief/php:arm64
$ docker manifest push jamielsharief/php:latest
```