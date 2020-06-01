FROM alpine:3.11.6
RUN apk add --update \
	tzdata \
	python3
RUN mkdir -p /root/.local/share
RUN rm -rf /var/cache/apk/*
RUN pip3 install --no-cache-dir -q vdirsyncer todoman
RUN adduser -S user
RUN mkdir /.cache && \
	chown 1000:1000 /.cache
WORKDIR /home/user
USER user
