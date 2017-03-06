# dnsdist on Docker

This repository contains a Docker image of PowerDNS [dnsdist](http://dnsdist.org/), based on [uniplug/dnsdist-docker](https://github.com/uniplug/dnsdist-docker).

> dnsdist is a highly DNS-, DoS- and abuse-aware loadbalancer. Its goal in life is to route traffic to the best server, delivering top performance to legitimate users while shunting or blocking abusive traffic.

* The Docker image is available at [sukiyaki/dnsdist](https://hub.docker.com/r/sukiyaki/dnsdist/)
* The GitHub repository is available at [sukiyaki/dnsdist](https://github.com/sukiyaki/dnsdist)

## Usage

Create a named container 'dnsdist'.
dnsdist starts and listens on ports 53 for dns in the container.
To map it to the host's ports, use the following command to create and start the container instead:

```bash
docker run -t --name dnsdist -p 53:53/tcp -p 53:53/udp -t sukiyaki/dnsdist
```

### Additional settings

dnsdist stores its config ```/etc/dnsdist/``` in the container.
If you wish to configure it, it is a good idea to set up a volume mapping for these path. For example:

```bash
docker run -t \
 --name dnsdist \
 -v /data/dnsdist/:/etc/dnsdist/ \
 -p 53:53/udp \
 sukiyaki/dnsdist
```
