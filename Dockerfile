FROM alpine:3.7
MAINTAINER zpkx@qq.com

#ENV TZ=Asia/Shanghai

# install frolvlad/alpine-python3
RUN apk add --no-cache python3 && \
	python3 -m ensurepip && \
	rm -r /usr/lib/python*/ensurepip && \
	pip3 install --upgrade pip setuptools

# install flexget
RUN apk --no-cache add ca-certificates tzdata && \
	pip3 install --upgrade --force-reinstall --ignore-installed \
		transmissionrpc python-telegram-bot flexget && \
	rm -r /root/.cache

# copy local files
COPY files/ /

# add default volumes
VOLUME /config
WORKDIR /config

# run init.sh to set uid, gid, permissions and to launch flexget
RUN chmod +x /scripts/init.sh
CMD ["/scripts/init.sh"]
