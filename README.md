# docker-flexget

Docker image for running [flexget](http://flexget.com/)

Container features are

- Lightweight alpine linux
- Python 3
- Flexget with initial settings (default ```config.yml```)
- pre-installed plug-ins (transmissionrpc, python-telegram-bot)

## Usage
```
docker run -d \
    --name=<container name> \
    -p <Host port>:<Web UI port defined config.yml> \
    -v <path for config files>:/config \
    -e FG_WEBUI_PASSWD=<desired password> \
    -e PUID=<UID for user> \
    -e PGID=<GID for user> \
    zpkx/flexget
```
