# multsev/sams2:centos7

# Introduction
`Dockerfile` to create a [Docker](https://www.docker.com/) container image for [SAMS2](https://github.com/PavelVinogradov/sams2).

## Contributing
If you find this image useful here's how you can help:
- Send a pull request with your awesome features and bug fixes.
- Help users resolve their [issues](../../issues?q=is%3Aopen+is%3Aissue).

## Issues
Before reporting your issue please try updating Docker to the latest version and check if it resolve the issue. Refer to the docker [installation guide](https://docs.docker.com/installation) for instructions.

If the above recommendations do not help then [report your issue](../../issue/new) along with the following information:
- Output of the `docker version` and `docker info` commands.
- The `dokcer run` command or `docker-compose.yml` used to start the image. Mask out the sensitive bits.
- Please state if you are using [Boot2Docker](http://www.boot2docker.io), [VirtualBox](https://www.virtualbox.org), etc.

# Getting started

## Installation
Build the image yourself.

```bash
docker build -t multsev/sams2 github.com/multsev/docker-sams2
```

## Quickstart
Start SAMS2 using:
```bash
git clone https://github.com/multsev/docker-sams2.git
cd docker-sams2/
docker-compose up -d
```

## Logs

To access the Squid logs, located at `/var/log/squid/`, you can use `docker exec`. For example, if you want to tail the access logs:

```bash
docker exec -it squid tail -f /var/log/squid/access.log
```

You can also mount a volume at `/var/log/squid/` so that the logs are directly accessible on the host.

# Maintenance

## Shell Access

For debugging and maintenance purposes you may want access the containers shell. If you are using Docker version `1.3.0` or higher you can access a running containers shell by starting `bash` using `docker exec`:

```bash
docker exec -it sams2 bash
```